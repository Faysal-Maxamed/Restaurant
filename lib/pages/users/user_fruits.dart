import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/fruit_provider.dart';
import 'package:resturent_app/pages/users/details_page.dart';

class UserFruits extends StatelessWidget {
  const UserFruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitProvider>(builder: (context, fruits, _) {
      final cart = context.read<CartProvider>().items;
      return Scaffold(
        backgroundColor: backgrounclr,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: backgrounclr,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: btnclr,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Badge(
                      label: Text(cart.length.toString()),
                      child: Icon(
                        LineIcons.shoppingBag,
                        size: 30,
                        color: btnclr,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Order fresh mixed Fruits",
                style: GoogleFonts.inter(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                    future: fruits.getfruits(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 205,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailsPage(
                                        imageurl: "images/1.png",
                                        title: snapshot.data![index].name,
                                        discription:
                                            snapshot.data![index].description,
                                        price: snapshot.data![index].price),
                                  ),
                                ),
                                child: Container(
                                  width: 155,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image.network(
                                            snapshot.data![index].image!,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            height: 80,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data[index].name,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                    .data![index].description,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 11,
                                                    color:
                                                        Colors.grey.shade500),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data![index].price!
                                                        .toString(),
                                                    style: GoogleFonts.dmSans(
                                                        color: btnclr),
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<CartProvider>()
                                                          .toggleItem(
                                                            snapshot
                                                                .data![index]
                                                                .name,
                                                            snapshot
                                                                .data![index]
                                                                .name,
                                                            snapshot
                                                                .data![index]
                                                                .price,
                                                            snapshot
                                                                .data![index]
                                                                .image,
                                                          );
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor: btnclr,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      minimumSize: Size(20, 24),
                                                    ),
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        Text("Xogti waalawaayey");
                      }
                      return CircularProgressIndicator();
                    }),
              )
            ],
          ),
        )),
      );
    });
  }
}
