import 'package:flutter/material.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';

class CartProvider extends ChangeNotifier {
  List<FoodProductModel> _CartItem = [];

  List get CartItem => _CartItem;

  addItem(FoodProductModel food) {
    _CartItem.add(food);
    notifyListeners();
  }
}
