import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/pages/admin/adminfoodpage.dart';

class AddFoodProvider extends ChangeNotifier {
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

  getid(String id) {
    _id = id;
    notifyListeners();
  }

  getname(String name) {
    _name = name;
    notifyListeners();
  }

  getimage(String image) {
    _image = image;
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
}
