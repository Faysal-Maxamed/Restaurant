import 'package:flutter/material.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  int _counter = 0;
  int get Counter => _counter;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(String id, String name, double price, String image) {
    _items.add(CartItem(
      id: id,
      name: name,
      price: price,
      image: image,
    ));

    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  Increment() {
    _counter++;
    notifyListeners();
  }

  Decrement() {
    if (Counter > 0) {
      _counter--;
    }
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
