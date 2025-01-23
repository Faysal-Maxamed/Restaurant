import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturent_app/constant/constant.dart';

class UpdateFoodProvider extends ChangeNotifier {
  String? _id;
  String? _name;
  String? _image;
  String? _category;
  String? _description;
  int? _price;
  int? _oldPrice;
  int? _rating;
  int? _countInStock;
  bool isloading = false;

  String get id => _id!;
  String get name => _name!;
  String get image => _image!;
  String get Category => _category!;
  String get description => _description!;
  int get price => _price!;
  int get oldPrice => _oldPrice!;
  int get rating => _rating!;
  int get countInStock => _countInStock!;

  updateid(String id) {
    _id = id;
    notifyListeners();
  }

  updatename(String name) {
    _name = name;
    notifyListeners();
  }

  updateimage(String image) {
    _image = image;
  }

  updatecategory(String Category) {
    _category = Category;
    notifyListeners();
  }

  updatedescription(String description) {
    _description = description;
    notifyListeners();
  }

  updateprice(int price) {
    _price = price;
    notifyListeners();
  }

  updateoldPrice(int oldPrice) {
    _oldPrice = oldPrice;
    notifyListeners();
  }

  updatecountInStock(int countInStock) {
    _countInStock = countInStock;
    notifyListeners();
  }

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
            "http://192.168.18.8:5000/api/foodproduct/678fde63687ef13bd98ded37"),
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
}
