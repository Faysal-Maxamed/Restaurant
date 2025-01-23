import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/pages/admin/adminfoodpage.dart';
import 'package:resturent_app/pages/admin/users_screen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounclr,
      appBar: AppBar(
        title: Text("Dashboard"),
        shadowColor: Colors.black,
        elevation: 5,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi Admin!"),
                SizedBox(
                  height: 70,
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Adminfoodpage(),
                    ),
                  ),
                  child: Text(
                    "Product",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                    ),
                  ),
                ),
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
  }
}
