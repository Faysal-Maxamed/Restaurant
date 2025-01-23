import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturent_app/constant/constant.dart';

class DeleteFoodProvider extends ChangeNotifier {
  delte() async {
    var response = await http.delete(
      Uri.parse(endpoint + "foodproduct/6790f48d646f3243db5d8d1c"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      SnackBar(content: Text("Product deleted!"));
    }
  }
}
