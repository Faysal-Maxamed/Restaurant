import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:resturent_app/pages/users/home.dart';
import 'package:resturent_app/pages/users/menu_screen.dart';

class ZoomDrawerScreen extends StatelessWidget {
  const ZoomDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: const MenuScreen(),
      mainScreen: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          body: HomeScreen(),
        ),
      ),
      style: DrawerStyle.defaultStyle,
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.fastOutSlowIn,
    );
  }
}
