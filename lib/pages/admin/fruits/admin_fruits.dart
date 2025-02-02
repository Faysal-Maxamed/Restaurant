import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/fruit_provider.dart';
import 'package:resturent_app/pages/admin/fruits/add_fruit.dart';
import 'package:resturent_app/pages/admin/fruits/update_fruits.dart';
import 'package:resturent_app/pages/users/details_page.dart';

class AdminFruitsScreen extends StatelessWidget {
  const AdminFruitsScreen({super.key});

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
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Order fresh mixed Fruits",
                  style: GoogleFonts.inter(fontSize: 18),
                ),
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
                              mainAxisExtent: 210,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsPage(
                                            imageurl: "images/1.png",
                                            title: snapshot.data![index].name,
                                            discription: snapshot
                                                .data![index].description,
                                            price: snapshot.data![index].price),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Image.network(
                                          snapshot.data![index].image,
                                          height: 70,
                                          width: 100,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            snapshot.data![index].name,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot.data![index].price
                                                        .toString(),
                                                    style: GoogleFonts.dmSans(
                                                        color: btnclr),
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data![index].oldPrice
                                                        .toString(),
                                                    style: GoogleFonts.dmSans(
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      final confirm =
                                                          await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AlertDialog(
                                                                        content:
                                                                            Text("DDo you want to delete this product?"),
                                                                        title: Text(
                                                                            "Delete"),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(context),
                                                                            child:
                                                                                Text("No"),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                context.read<FruitProvider>().fruitdelte(snapshot.data![index].id),
                                                                            child:
                                                                                Text("Yes"),
                                                                          ),
                                                                        ],
                                                                      ));
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      minimumSize: Size(20, 24),
                                                    ),
                                                    icon: Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () =>
                                                        Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            UpdateFruits(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id),
                                                      ),
                                                    ),
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      minimumSize: Size(20, 24),
                                                    ),
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddFruitScreen(),
            ),
          ),
          label: Text("Add Fruits"),
        ),
      );
    });
  }
}
