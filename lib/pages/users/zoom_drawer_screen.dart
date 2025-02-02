import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/admin/dashboard.dart';
import 'package:resturent_app/pages/users/home.dart';
import 'menu_screen.dart'; // Import your custom MenuScreen

class ZoomDrawerWrapper extends StatelessWidget {
  ZoomDrawerWrapper({super.key});
  LoginProvider? login;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuScreen(),
      mainScreen: HomeScreen(), 
      borderRadius: 30.0,
      showShadow: true,
      angle: -5.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}
