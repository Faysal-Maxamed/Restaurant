import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/users/about.dart';
import 'package:resturent_app/pages/users/cart_screen.dart';
import 'package:resturent_app/pages/users/contact.dart';
import 'package:resturent_app/pages/users/onboarding.dart';
import 'package:resturent_app/pages/users/profile.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  LoginProvider? login;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, _) {
      return Scaffold(
        backgroundColor: btnclr,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/logo.png"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Fatxi Restaurant",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        ZoomDrawer.of(context)!.close();
                      },
                    ),
                    ListTile(
                      leading: Badge(
                          label: Text(cart.items.length.toString()),
                          child:
                              Icon(Icons.shopping_cart, color: Colors.white)),
                      title: Text(
                        "Carts",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CartScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AboutPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail, color: Colors.white),
                      title: Text(
                        "Contact",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ContactPage()));
                      },
                    ),
                    Divider(color: Colors.white.withOpacity(0.5)),
                    ListTile(
                      leading: Icon(Icons.person_4, color: Colors.white),
                      title: Text(
                        "Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ProfileScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.white),
                      title: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        ZoomDrawer.of(context)!.close();
                      },
                    ),
                  ],
                ),
              ),

              // Logout Button at Bottom Center
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OnboardingScreen()));
                      // Handle logout logic here
                    },
                    icon: Icon(Icons.logout, color: Colors.blueAccent),
                    label: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
