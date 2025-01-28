import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:resturent_app/pages/admin/Food/adminfoodpage.dart';

class FoodProvider extends ChangeNotifier {
  String? _id;
  String? _name;
  File? _image;
  String? _category;
  String? _description;
  int? _price;
  int? _oldPrice;
  int? _countInStock;
  bool isloading = false;

  String get id => _id ?? '';
  String get name => _name ?? '';
  File? get image => _image;
  String get category => _category ?? '';
  String get description => _description ?? '';
  int get price => _price ?? 0;
  int get oldPrice => _oldPrice ?? 0;
  int get countInStock => _countInStock ?? 0;
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
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        notifyListeners();
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> addFood(BuildContext context) async {
    try {
      String imgUrl = '';
      final cloudinary =
          CloudinaryPublic('dsqdn5uib', 'ml_default', cache: false);

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(_image!.path,
            resourceType: CloudinaryResourceType.Image),
      );
      imgUrl = response.secureUrl;

      if (imgUrl.isNotEmpty) {
        var data = {
          "name": _name,
          "category": _category,
          "image": imgUrl,
          "description": _description,
          "countInStock": _countInStock,
          "price": _price,
          "oldPrice": _oldPrice,
        };

        try {
          var response = await http.post(
            Uri.parse(endpoint + "foodproduct"),
            body: jsonEncode(data),
            headers: {"Content-Type": "application/json"},
          );

          if (response.statusCode == 201) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Product created successfully")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Adminfoodpage()),
            );
          } else {
            print("Failed to create product: ${response.body}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to create product")),
            );
          }
        } catch (e) {
          print("HTTP error: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error creating product: $e")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image URL is empty")),
        );
      }
    } catch (e) {
      print("Unexpected error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
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

  update(BuildContext context, String id) async {
    isloading = true;
    notifyListeners();
    try {
      String imgurl = '';
      final cloudinary =
          CloudinaryPublic('dsqdn5uib', 'ml_default', cache: false);

      CloudinaryResponse responseurl = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image!.path,
            resourceType: CloudinaryResourceType.Image),
      );
      imgurl = responseurl.secureUrl;

      if (imgurl.isNotEmpty) {
        var date = <String, dynamic>{
          "name": name,
          "category": category,
          "image": imgurl,
          "description": description,
          "price": price,
          "countInStock": countInStock,
          "oldPrice": oldPrice,
          "counInStock": countInStock,
        };
        var response = await http.put(
          Uri.parse("http://192.168.18.8:5000/api/foodproduct/$id"),
          body: jsonEncode(date),
          headers: {"Content-Type": "application/json"},
        );

        if (response.statusCode == 200) {
          SnackBar(content: Text("succsefully"));
          Navigator.pop(context);
        } else {
          print(response.body);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed do update image"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  //  kan waa fuctionka nooqabanaayo inaa product delte ku sameeno

  delte(String id) async {
    var response = await http.delete(
      Uri.parse(endpoint + "foodproduct/$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      SnackBar(content: Text("Product deleted!"));
    }
  }
}
