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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: btnclr,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Profile Picture
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Personal Info Title
                Text(
                  "Personal Info",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),

                // User Details
                Expanded(
                  child: ListView(
                    children: [
                      _buildInfoRow("Your Name", login.user!.name ?? "N/A"),
                      SizedBox(height: 15),
                      _buildInfoRow("Your Email", login.user!.email ?? "N/A"),
                      SizedBox(height: 15),
                      _buildInfoRow(
                          "Your Address", login.user!.address ?? "N/A"),
                      SizedBox(height: 15),
                      _buildInfoRow(
                          "Your Role", login.user!.isAdmin! ? "Admin" : "User"),
                      SizedBox(height: 15),
                      _buildInfoRow(
                          "Your Phone", login.user!.phone.toString() ?? "N/A"),
                    ],
                  ),
                ),

                // Update Button
                ElevatedButton(
                  onPressed: () {
                    // Add update logic here
                  },
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
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Exit Button
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OnboardingScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Helper Widget for Info Rows
  Widget _buildInfoRow(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
