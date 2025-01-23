import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:resturent_app/pages/admin/addfood.dart';
import 'package:resturent_app/pages/admin/update_food.dart';
import 'package:resturent_app/pages/users/details_page.dart';

class Adminfoodpage extends StatelessWidget {
  const Adminfoodpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FutureBuilder<List<FoodProductModel>>(
                  future: context.read<FoodProvider>().getfoods(),
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
                                          imageurl: snapshot.data!.last!.image,
                                          title: snapshot.data![index].name,
                                          discription:
                                              snapshot.data![index].description,
                                          price: snapshot.data![index].price),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 3))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Center(
                                        child: Image.network(
                                          snapshot.data![index].image,
                                          width: 70,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          snapshot.data![index].name,
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
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
                                                  snapshot!
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
                                                  onPressed: () {
                                                    context
                                                        .read<FoodProvider>()
                                                        .delte();
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    minimumSize: Size(20, 24),
                                                  ),
                                                  icon: Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                UpdateFood()));
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                      return Text("Xogti waalawaayey");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Addfood(),
          ),
        ),
        backgroundColor: btnclr,
        foregroundColor: Colors.white,
        label: Text(
          "Add Product",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
      ),
    );
  }
}
