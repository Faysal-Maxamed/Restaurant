import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/food_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              " Cart Page",
              style: GoogleFonts.poppins(),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Badge(
                  label: Text("1"),
                  child: Icon(Icons.shopping_cart),
                ),
              )
            ],
          ),
          body: cart.items.isEmpty
              ? Center(
                  child: Text(
                  "No Cart Availble yet",
                  style: GoogleFonts.rubik(fontSize: 18),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: context.read<CartProvider>().items.length,
                        itemBuilder: (context, index) {
                          final cart = context.read<CartProvider>();
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Card(
                                elevation: 10,
                                color: btnclr,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                              child:
                                                  Image.asset("images/1.png")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cart.items[index].name,
                                                style: GoogleFonts.poppins(),
                                              ),
                                              Text(
                                                "\$${cart.items[index].price.toString()}",
                                                style: GoogleFonts.poppins(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    foregroundColor:
                                                        Colors.white),
                                                onPressed: () =>
                                                    cart.Decrement(),
                                                icon: Icon(Icons.remove),
                                              ),
                                              Text(context
                                                  .watch<CartProvider>()
                                                  .Counter
                                                  .toString()),
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  foregroundColor: Colors.white,
                                                ),
                                                onPressed: () =>
                                                    cart.Increment(),
                                                icon: Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              cart.removeItem(
                                                  cart.items[index].id);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              minimumSize: Size(60, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: Text("Remove Item"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
    });
  }
}
