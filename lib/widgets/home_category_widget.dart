import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCategoryWidget extends StatelessWidget {
   HomeCategoryWidget(
      {super.key, required this.nmetitle, this.clr, this.isselected = false,required this.navpage});
  final nmetitle;
  final clr;
  bool isselected;
  final navpage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (_)=>navpage)),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(95, 41),
          backgroundColor: clr,
          foregroundColor: isselected ? Colors.white : Colors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.black),
      child: Text(
        nmetitle,
        style: GoogleFonts.inter(fontSize: 16),
      ),
    );
  }
}
