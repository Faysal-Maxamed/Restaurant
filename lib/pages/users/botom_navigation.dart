import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/pages/users/cart_screen.dart';
import 'package:resturent_app/pages/users/chats.dart';
import 'package:resturent_app/pages/users/home.dart';
import 'package:resturent_app/pages/users/profile.dart';

class BotomNavigationScreen extends StatefulWidget {
  const BotomNavigationScreen({super.key});

  @override
  State<BotomNavigationScreen> createState() => _BotomNavigationScreenState();
}

class _BotomNavigationScreenState extends State<BotomNavigationScreen> {
  int currentindex = 0;
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    ChatsScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounclr,
      body: pages[currentindex],
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
          Icon(LineIcons.shoppingCart),
          Icon(LineIcons.home),
          Icon(LineIcons.user),
        ],
      ),
    );
  }
}
