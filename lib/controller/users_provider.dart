import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/login_model.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  List<LoginModel> users = [];

  Future<List<LoginModel>> getUsers() async {
    var response = await http.get(Uri.parse(endpoint + "users/"));
    if (response.statusCode == 200) {
      var decodedate = jsonDecode(response.body);
      for (var element in decodedate) {
        users.add(LoginModel.fromJson(element));
      }
    }
    return users;
  }
}
