import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Cart Page",
              style: GoogleFonts.poppins(),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Badge(
                  label: Text(cart.items.length.toString()),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ],
          ),
          body: cart.items.isEmpty
              ? Center(
                  child: Text(
                    "No Cart Available yet",
                    style: GoogleFonts.rubik(fontSize: 18),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Card(
                              elevation: 10,
                              color: btnclr,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: Image.network(
                                              item.image, // Use network image from item
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: GoogleFonts.poppins(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                "\$${item.price.toStringAsFixed(2)}",
                                                style: GoogleFonts.poppins(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  cart.decrement(item.id),
                                              icon: const Icon(Icons.remove),
                                            ),
                                            Text(item.quantity.toString()),
                                            IconButton(
                                              onPressed: () =>
                                                  cart.increment(item.id),
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<CartProvider>()
                                                .removeItem(item.id);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                            minimumSize: const Size(60, 30),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          child: const Text("Remove Item"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Total Items:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  cart.items.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Total Price:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  "\$${cart.totalAmount.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 60),
                                backgroundColor: btnclr,
                              ),
                              child: Text(
                                "Buy",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
          floatingActionButton: cart.items.isEmpty
              ? null
              : FloatingActionButton(
                  onPressed: () => cart.clearCart(),
                  child: Icon(Icons.close),
                ));
    });
  }
}
