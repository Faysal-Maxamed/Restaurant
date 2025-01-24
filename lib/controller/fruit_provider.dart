import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';

class FruitProvider extends ChangeNotifier {
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

  Future getfruits() async {
    isloading = true;
    notifyListeners();
    List<FoodProductModel> ListFruits = [];
    var response = await http.get(Uri.parse(endpoint + "fruitproduct/"));
    if (response.statusCode == 200) {
      var decodedate = jsonDecode(response.body);
      for (var element in decodedate) {
        ListFruits.add(FoodProductModel.fromJson(element));
        print("sucseccfully");
      }
    } else {
      print("error");
    }
    isloading = false;
    notifyListeners();
    return ListFruits;
  }
}
