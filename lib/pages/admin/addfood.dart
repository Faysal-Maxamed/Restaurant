import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/add_food_provider.dart';
import 'package:image_picker/image_picker.dart';

class Addfood extends StatelessWidget {
  Addfood({super.key});

  @override
  Widget build(BuildContext context) {
    var addfoodprovider = context.read<AddFoodProvider>();
    return Consumer<AddFoodProvider>(builder: (context, addfood, _) {
      return ModalProgressHUD(
        inAsyncCall: addfood.isloading,
        child: Scaffold(
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
                      onChanged: (value) => addfoodprovider.getimage(value),
                      decoration: InputDecoration(
                        hintText: "enter Image",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) => addfoodprovider.getname(value),
                      decoration: InputDecoration(
                        hintText: "Enter Name of product",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) => addfoodprovider.getcategory(value),
                      decoration: InputDecoration(
                        hintText: "Category Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) {
                        int? intvalue = int.tryParse(value);
                        if (intvalue != null) {
                          addfoodprovider.getprice(intvalue);
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
                          addfoodprovider.getoldPrice(intvalue);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "oldPrice",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) {
                        int? intvalue = int.tryParse(value);
                        if (intvalue != null) {
                          addfoodprovider.getcountInStock(intvalue);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "CountInStock",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) =>
                          addfoodprovider.getdescription(value),
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => addfoodprovider.addfood(context),
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
        ),
      );
    });
  }
}
