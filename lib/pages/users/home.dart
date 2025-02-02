import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/controller/fruit_provider.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/users/userfood_page.dart';
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
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              ZoomDrawer.of(context)!.toggle(); // Toggle the drawer
            },
          ),
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
                Text(
                  login.user!.email!,
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xff0A2533)),
                ),
              ],
            ),
            trailing: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person_3_outlined,
                size: 30,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
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
                        nmetitle: "Fruits",
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
                          "Popular Products",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1F2937)),
                        ),
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
                  Container(
                    height: 200, // Increased height for better spacing
                    child: FutureBuilder(
                      future: context.read<FoodProvider>().getfoods(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final foodItem = snapshot.data![index];

                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(5), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      child: Image.network(
                                        foodItem.image,
                                        height: 80,
                                        width: double.infinity,
                                        fit: BoxFit
                                            .fitWidth, // Better image fitting
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            10), // Space between image and text
                                    Text(
                                      foodItem.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        foodItem.description,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600]),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Space before price
                                    Text(
                                      "\$${foodItem.price.toString()}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .green[700], // Highlight price
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: FutureBuilder(
                      future: context.read<FruitProvider>().getfruits(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final foodItem = snapshot.data![index];

                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        child: Image.asset(
                                      "images/1.png",
                                    )),
                                    SizedBox(
                                        height:
                                            10), // Space between image and text
                                    Text(
                                      foodItem.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        foodItem.description,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600]),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Space before price
                                    Text(
                                      "\$${foodItem.price.toString()}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .green[700], // Highlight price
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
