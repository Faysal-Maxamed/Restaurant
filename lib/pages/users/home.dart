import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/users/userfood_page.dart';
import 'package:resturent_app/pages/users/menu_screen.dart';
import 'package:resturent_app/pages/users/user_fruits.dart';
import 'package:resturent_app/widgets/discount_widget.dart';
import 'package:resturent_app/widgets/home_category_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, login, _) {
      return Scaffold(
        backgroundColor: backgrounclr,
        appBar: AppBar(
          leading: MenuScreen(),
          backgroundColor: backgrounclr,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  login.user!.name!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xff0A2533),
                  ),
                ),
                // Text(
                //   login.user!.email!,
                //   style: GoogleFonts.poppins(
                //       fontSize: 14, color: Color(0xff0A2533)),
                // ),
              ],
            ),
            trailing: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("images/profile.png"),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Featured",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0A2533)),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DiscountWidget(
                        cl1: Color(0xff70B9BE),
                        cl2: Color(0xffE1EEF4),
                        imgurl: "images/hum.png",
                        logo: "images/king.png",
                        tittext: "Flash Offer",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DiscountWidget(
                        cl1: Color(0xff00D756),
                        cl2: Color(0xff018AC5),
                        imgurl: "images/Pizza.png",
                        logo: "images/logo2.png",
                        tittext: "New Arrivable",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0A2533)),
                ),
                Row(
                  children: [
                    HomeCategoryWidget(
                      nmetitle: "Foods",
                      clr: btnclr,
                      isselected: true,
                      navpage: BreakfastPageScreen(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCategoryWidget(
                      nmetitle: "Pidzza",
                      navpage: UserFruits(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCategoryWidget(
                      nmetitle: "Fruits",
                      navpage: BreakfastPageScreen(),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today New Arivable",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1F2937)),
                      ),
                      Text(
                        "Best of the today  food list update",
                        style: GoogleFonts.inter(
                            color: Color(0xff6B7280),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  trailing: Text(
                    "see all",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 240),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/SauceTonkatsu.png",
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Chicken Biryani",
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Ambrosia Hotel & Restaurant",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
