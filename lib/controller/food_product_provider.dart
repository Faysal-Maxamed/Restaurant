import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:http/http.dart' as http;

class FoodProductProvider extends ChangeNotifier {
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
}
