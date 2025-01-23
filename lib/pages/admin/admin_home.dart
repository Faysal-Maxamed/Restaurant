import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/pages/admin/tab_bar.dart';
import 'package:resturent_app/pages/admin/users_screen.dart';
import 'package:resturent_app/pages/users/profile.dart';

class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int currentindex = 0;

  List<Widget> adminpages = [
    TabBarScreen(),
    UsersScreen(),
    ProfileScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminpages[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: backgrounclr,
          color: btnclr,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: [
            Icon(LineIcons.home),
            Icon(Icons.person_add_alt_sharp),
            Icon(Icons.person_3),
          ]),
    );
  }
}
