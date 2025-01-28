import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/controller/fruit_provider.dart';

class AddFruitScreen extends StatefulWidget {
  AddFruitScreen({super.key});

  @override
  State<AddFruitScreen> createState() => _AddFruitScreenState();
}

class _AddFruitScreenState extends State<AddFruitScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FruitProvider>(builder: (context, addfruit, _) {
      return Scaffold(
        backgroundColor: backgrounclr,
        appBar: AppBar(
          title: Text("Add product"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => addfruit.getname(value),
                    decoration: InputDecoration(
                      hintText: "Enter Name of product",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => addfruit.getcategory(value),
                    decoration: InputDecoration(
                      hintText: "Category Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: addfruit.getImage,
                    child: addfruit.image == null
                        ? Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Icon(Icons.photo, size: 50),
                          )
                        : Image.file(
                            addfruit.image!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => addfruit.getdescription(value),
                    decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) {
                      int? intvalue = int.tryParse(value);
                      if (intvalue != null) {
                        addfruit.getcountInStock(intvalue);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "CountInStock",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (value) {
                      int? intvalue = int.tryParse(value);
                      if (intvalue != null) {
                        addfruit.getprice(intvalue);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) {
                      int? intvalue = int.tryParse(value);
                      if (intvalue != null) {
                        addfruit.getoldPrice(intvalue);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "oldPrice",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => addfruit.addfruit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
