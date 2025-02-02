import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/models/login_model.dart';
import 'package:resturent_app/pages/admin/dashboard.dart';
import 'package:resturent_app/pages/users/botom_navigation.dart';
import 'package:resturent_app/pages/users/zoom_drawer_screen.dart';

class LoginProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  LoginModel? user;
  bool isloading = false;
  final box = GetStorage();

  LoginProvider() {
    getUserInfo();
  }

  String get email => _email!;
  String get password => _password!;

  void getemail(String email) {
    _email = email;
    notifyListeners();
  }

  void getpassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isloading = true;
    notifyListeners();
    try {
      var data = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(endpoint + "users/login"),
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        user = LoginModel.fromJson(decodedData);
        saveuser(user!);
        if (user!.isAdmin == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Dashboard(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Successfully logged in'),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ZoomDrawerWrapper(),
            ),
          );
        }
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  void saveuser(LoginModel user) {
    box.write(UserInfo, user.toJson());
    box.write(isloggedIn, "isloggedIn");
    notifyListeners();
  }

  void getUserInfo() {
    if (box.hasData(UserInfo)) {
      var data = box.read(UserInfo);
      if (data != null) {
        user = LoginModel.fromJson(data);
        notifyListeners();
      }
    }
  }
}
