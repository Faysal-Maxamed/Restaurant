import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/users/onboarding.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, login, _) {
      return Scaffold(
        backgroundColor: backgrounclr,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: backgrounclr,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: btnclr,
                      ),
                    )
                  ],
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Personal Info",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                RowWidget(
                  tit1: "Your Name",
                  tit2: login.user!.name,
                ),
                SizedBox(
                  height: 20,
                ),
                RowWidget(
                  tit1: "Your Email",
                  tit2: login.user!.email,
                ),
                SizedBox(
                  height: 20,
                ),
                RowWidget(
                  tit1: "Your Address",
                  tit2: login.user!.phone.toString(),
                ),
                SizedBox(
                  height: 20,
                ),
                RowWidget(
                  tit1: "Your Role",
                  tit2: login.user!.isAdmin!.toString(),
                ),
                SizedBox(
                  height: 20,
                ),
                RowWidget(
                  tit1: "Your Phone",
                  tit2: login.user!.phone.toString(),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Update",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OnboardingScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Exit",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.tit1,
    required this.tit2,
  });
  final tit1;
  final tit2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tit1,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          tit2,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
