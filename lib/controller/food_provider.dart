import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:resturent_app/pages/admin/adminfoodpage.dart';

class FoodProvider extends ChangeNotifier {
  String? _id;
  String? _name;
  File? _image;
  String? _category;
  String? _description;
  int? _price;
  int? _oldPrice;
  int? _rating;
  int? _countInStock;
  bool isloading = false;

  String get id => _id!;
  String get name => _name!;
  File get image => _image!;
  String get Category => _category!;
  String get description => _description!;
  int get price => _price!;
  int get oldPrice => _oldPrice!;
  int get rating => _rating!;
  int get countInStock => _countInStock!;

  getid(String id) {
    _id = id;
    notifyListeners();
  }

  getname(String name) {
    _name = name;
    notifyListeners();
  }

  getcategory(String Category) {
    _category = Category;
    notifyListeners();
  }

  getdescription(String description) {
    _description = description;
    notifyListeners();
  }

  getprice(int price) {
    _price = price;
    notifyListeners();
  }

  getoldPrice(int oldPrice) {
    _oldPrice = oldPrice;
    notifyListeners();
  }

  getcountInStock(int countInStock) {
    _countInStock = countInStock;
    notifyListeners();
  }

  void getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _image = File(pickedImage!.path);
      notifyListeners();
    } else {
      Text("no image selected");
    }
  }

  //  kan waa fuctionka noogu soo daraayo product  cusub

  addfood(BuildContext context) async {
    var date = <String, dynamic>{
      "name": name,
      "category": Category,
      "image": image,
      "description": description,
      "countInStock": countInStock,
      "price": price,
      "oldPrice": oldPrice,
    };
    print(date);
    var response = await http.post(
      Uri.parse(endpoint + "foodproduct"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 201) {
      var decodedate = jsonDecode(response.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Adminfoodpage()));
    } else {
      print("error ocuur");
    }
  }

  //  kan waa fuctionka nooqabanaayo  inaa kasoo aqrisano backend amd  database

  Future<List<FoodProductModel>> getfoods() async {
    List<FoodProductModel> ListFoods = [];
    try {
      var response = await http.get(Uri.parse(endpoint + "foodproduct/"));
      if (response.statusCode == 200) {
        var decodedate = jsonDecode(response.body);
        print(decodedate);
        for (var element in decodedate) {
          ListFoods.add((FoodProductModel.fromJson(element)));
        }
        notifyListeners();
        print(decodedate);
      }
    } catch (err) {
      print(err);
    }
    return ListFoods;
  }

//  kan waa fuctionka nooqabanaayo  inaa xogta badalno ama update kusiibino

  update(BuildContext context) async {
    var date = <String, dynamic>{
      "name": name,
      "category": Category,
      "image": image,
      "description": description,
      "price": price,
      "countInStock": countInStock,
      "oldPrice": oldPrice,
      "counInStock": countInStock,
    };

    try {
      var response = await http.put(
        Uri.parse(
            "http://192.168.18.8:5000/api/foodproduct/679206d7debefc4899572aa7"),
        body: jsonEncode(date),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var decodedate = jsonDecode(response.body);
        SnackBar(content: Text("succsefully"));
        Navigator.pop(context);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  //  kan waa fuctionka nooqabanaayo inaa product delte ku sameeno

  delte() async {
    var response = await http.delete(
      Uri.parse(endpoint + "foodproduct/679206d7debefc4899572aa7"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      SnackBar(content: Text("Product deleted!"));
    }
  }
}
