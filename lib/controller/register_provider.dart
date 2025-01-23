import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/pages/users/login.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _password;
  String? _phone;
  String? _address;
  bool isLoading = false;
  bool _isAdmin = false;

  String get name => _name!;
  String get email => _email!;
  String get password => _password!;
  String get phone => _phone!;
  String get address => _address!;
  bool get isadmin => _isAdmin!;

  void getname(String name) {
    _name = name;
    notifyListeners();
  }

  void getemail(String email) {
    _email = email;
    notifyListeners();
  }

  void getPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void getPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void getAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void getIsAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  Register(BuildContext context) async {
    var date = <String, dynamic>{
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
      "isAdmin": isadmin,
    };
    var response = await http.post(
      Uri.parse(endpoint + "users"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
      SnackBar(content: Text("rrr"));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('already exits')),
      );
    }
  }
}
