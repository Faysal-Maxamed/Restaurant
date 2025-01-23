import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/controller/cart_provider.dart';

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
          children: [],
        ));
  }
}
