import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resturent_app/constant/constant.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.imageurl,
    required this.title,
    required this.discription,
    required this.price,
  });
  final imageurl;
  final title;
  final discription;
  final price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnclr,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: btnclr,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(LineIcons.heart),
                        )
                      ],
                    ),
                    Image.network(
                      imageurl,
                      width: 150,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgrounclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: fontclr,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescrRow(
                            name: "65g Carbs",
                            icon1: Icon(LineIcons.heart),
                          ),
                          DescrRow(
                            name: "27g prot..",
                            icon1: Icon(LineIcons.heart),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescrRow(
                            name: "120 Kcal",
                            icon1: Icon(LineIcons.heart),
                          ),
                          DescrRow(
                            name: "91g fats..",
                            icon1: Icon(LineIcons.heart),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        discription,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xff748189),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: btnclr,
                            minimumSize: Size(double.infinity, 70),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Add Cart",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescrRow extends StatelessWidget {
  const DescrRow({super.key, required this.icon1, required this.name});

  final Icon icon1;
  final name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
          child: icon1,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 16),
        )
      ],
    );
  }
}
