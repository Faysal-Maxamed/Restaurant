import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/food_provider.dart';

class UpdateFood extends StatelessWidget {
  UpdateFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, FoodProvider, _) {
      return Scaffold(
        backgroundColor: backgrounclr,
        appBar: AppBar(
          title: Text("Update product"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => FoodProvider.getImage,
                    decoration: InputDecoration(
                      hintText: "enter Image",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => FoodProvider.getname(value),
                    decoration: InputDecoration(
                      hintText: "Enter Name of product",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => FoodProvider.getcategory(value),
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
                        FoodProvider.getprice(intvalue);
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
                        FoodProvider.getoldPrice(intvalue);
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
                        FoodProvider.getcountInStock(intvalue);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "CountInStock",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => FoodProvider.getdescription(value),
                    decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => FoodProvider.update(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Update",
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
