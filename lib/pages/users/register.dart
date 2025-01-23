import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/register_provider.dart';
import 'package:resturent_app/pages/users/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, register, _) {
      return ModalProgressHUD(
        inAsyncCall: register.isLoading,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgound.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: btnclr,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "create an account so you can explore all\n existing jobs",
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: context.read<RegisterProvider>().isadmin,
                        onChanged: (value) {
                          context
                              .read<RegisterProvider>()
                              .getIsAdmin(value!); // Set the new value
                        },
                      ),
                      Text("Register as Admin"),
                    ],
                  ),
                  Container(
                    width: 357,
                    height: 64,
                    decoration: BoxDecoration(
                      color: backgrounclr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          context.read<RegisterProvider>().getname(value),
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 357,
                    height: 64,
                    decoration: BoxDecoration(
                      color: backgrounclr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          context.read<RegisterProvider>().getemail(value),
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 357,
                    height: 64,
                    decoration: BoxDecoration(
                      color: backgrounclr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) =>
                          context.read<RegisterProvider>().getPassword(value),
                      decoration: InputDecoration(
                        hintText: "password",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 357,
                    height: 64,
                    decoration: BoxDecoration(
                      color: backgrounclr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          context.read<RegisterProvider>().getPhone(value),
                      decoration: InputDecoration(
                        hintText: "Phone",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 357,
                    height: 64,
                    decoration: BoxDecoration(
                      color: backgrounclr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          context.read<RegisterProvider>().getAddress(value),
                      decoration: InputDecoration(
                        hintText: "Address",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<RegisterProvider>(context, listen: false)
                            .Register(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(357, 64),
                      backgroundColor: btnclr,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text("Already have account"),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ))
                    ],
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
