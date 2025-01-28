import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/food_provider.dart';
import 'package:resturent_app/models/food_product_pmodel.dart';
import 'package:resturent_app/models/login_model.dart';

class UpdateFood extends StatelessWidget {
  UpdateFood({super.key, required this.id});
  final id;
  @override
  FoodProductModel? Food;
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, FoodProvider, _) {
      return ModalProgressHUD(
        inAsyncCall: FoodProvider.isloading,
        child: Scaffold(
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
                    GestureDetector(
                      onTap: FoodProvider.getImage,
                      child: FoodProvider.image == null
                          ? Container(
                              height: 150,
                              width: double.infinity,
                              child: Icon(Icons.image),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                            )
                          : Image.file(
                              FoodProvider.image!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                      onPressed: () => FoodProvider.update(context, id),
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
        ),
      );
    });
  }
}
