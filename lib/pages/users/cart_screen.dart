import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/controller/cart_provider.dart';
import 'package:resturent_app/controller/food_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            IconButton(
              onPressed: () => context.read<CartProvider>().clearCart(),
              icon: Icon(Icons.clear),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.read<CartProvider>().items.length,
                itemBuilder: (context, index) {
                  final cart = context.read<CartProvider>();
                  return ListTile(
                    title: Text(cart.items[index].name),
                    leading: Text(cart.items[index].price.toString()),
                  );
                },
              ),
            )
          ],
        ));
  }
}
