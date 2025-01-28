import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/fruit_provider.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/controller/register_provider.dart';
import 'package:resturent_app/controller/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/pages/admin/dashboard.dart';

void main() async {
  await GetStorage.init();
  // final box = GetStorage();
  // final hasdate = box.hasData(isloggedIn);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FruitProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FoodProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider<RegisterProvider>(
            create: (_) => RegisterProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    ),
  );
}
