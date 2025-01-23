
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
    required this.cl1,
    required this.cl2,
    this.logo,
    this.tittext,
    this.imgurl,
  });
  final Color cl1;
  final Color cl2;
  final logo;
  final tittext;
  final imgurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10),
      height: 140,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            cl1,
            cl2,
          ],
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo),
              SizedBox(
                height: 10,
              ),
              Text(
                tittext,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "We are here with the \nbest deserts intown.",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),
              )
            ],
          ),
          Spacer(),
          Image.asset(
            imgurl,
          ),
        ],
      ),
    );
  }
}
