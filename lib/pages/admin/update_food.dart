import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/update_food_provider.dart';

class UpdateFood extends StatelessWidget {
  UpdateFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateFoodProvider>(builder: (context, UpdateFood, _) {
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
                    onChanged: (value) => UpdateFood.updateimage(value),
                    decoration: InputDecoration(
                      hintText: "enter Image",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => UpdateFood.updatename(value),
                    decoration: InputDecoration(
                      hintText: "Enter Name of product",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => UpdateFood.updatecategory(value),
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
                        UpdateFood.updateprice(intvalue);
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
                        UpdateFood.updateoldPrice(intvalue);
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
                        UpdateFood.updatecountInStock(intvalue);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "CountInStock",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) => UpdateFood.updatedescription(value),
                    decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => UpdateFood.update(context),
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
