import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:resturent_app/pages/users/details_page.dart';

class BreakfastPageScreen extends StatelessWidget {
  const BreakfastPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, _) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
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
                        label: Text(cart.items.length.toString()),
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
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Serach what food you want",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: FutureBuilder<List<FoodProductModel>>(
                    future: context.read<FoodProvider>().getfoods(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 220,
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
                                            imageurl:
                                                snapshot.data![index].image,
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Image.network(
                                          snapshot.data![index].image,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          height: 60,
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
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            snapshot.data![index].description,
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                color: Color(0xff3B3B3B)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data![index].price
                                                    .toString(),
                                                style: GoogleFonts.dmSans(
                                                    color: btnclr),
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () => context
                                                    .read<CartProvider>()
                                                    .toggleItem(
                                                      snapshot
                                                          .data![index].name,
                                                      snapshot
                                                          .data![index].name,
                                                      snapshot
                                                          .data![index].price,
                                                      snapshot
                                                          .data![index].image,
                                                    ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor: btnclr,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  minimumSize: Size(20, 24),
                                                ),
                                                icon: Icon(
                                                  cart.containsItem(snapshot
                                                          .data![index].name)
                                                      ? Icons.check
                                                      : Icons.add,
                                                  color: Colors.white,
                                                ),
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
      );
    });
  }
}
