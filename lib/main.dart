import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/add_food_provider.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/delete_food_provider.dart';
import 'package:resturent_app/controller/food_product_provider.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/controller/register_provider.dart';
import 'package:resturent_app/controller/update_food_provider.dart';
import 'package:resturent_app/controller/users_provider.dart';
import 'package:resturent_app/pages/admin/addfood.dart';
import 'package:resturent_app/pages/admin/admin_home.dart';
import 'package:resturent_app/pages/users/botom_navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  final hasdate = box.hasData(isloggedIn);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeleteFoodProvider()),
        ChangeNotifierProvider(create: (_) => UpdateFoodProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddFoodProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider<RegisterProvider>(
            create: (_) => RegisterProvider()),
        ChangeNotifierProvider<FoodProductProvider>(
            create: (_) => FoodProductProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdminHomeScreen(),
      ),
    ),
  );
}
