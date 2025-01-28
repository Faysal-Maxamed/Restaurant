import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/admin/Food/adminfoodpage.dart';
import 'package:resturent_app/pages/admin/fruits/admin_fruits.dart';
import 'package:resturent_app/pages/admin/users_screen.dart';
import 'package:resturent_app/pages/users/profile.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, login, _) {
      return Scaffold(
        backgroundColor: backgrounclr,
        appBar: AppBar(
          title: Text("Dashboard"),
          shadowColor: Colors.black,
          elevation: 5,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.png"),
                  )),
                  Center(
                    child: Text(
                      "Hi Admin ${login.user!.name!}👋",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Adminfoodpage(),
                      ),
                    ),
                    child: Text(
                      "Foods",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdminFruitsScreen(),
                      ),
                    ),
                    child: Text(
                      "Fruits",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (_) => AdminFruitsScreen(),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     "Fruits",
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 22,
                  //     ),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UsersScreen(),
                      ),
                    ),
                    child: Text(
                      "Users",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(),
                      ),
                    ),
                    child: Text(
                      "Profile",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            spreadRadius: 5,
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("2000"),
                        Text("users"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            spreadRadius: 5,
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("310"),
                        Text("Products"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
