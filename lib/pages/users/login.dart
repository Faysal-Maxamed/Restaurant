import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/login_provider.dart';
import 'package:resturent_app/pages/users/register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, user, _) {
      return ModalProgressHUD(
        inAsyncCall: user.isloading,
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
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "login here",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: btnclr,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 357,
                      height: 64,
                      decoration: BoxDecoration(
                        color: backgrounclr,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<LoginProvider>().getemail(value);
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Fadlan geli email sax ah";
                          return null;
                        },
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
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<LoginProvider>().getpassword(value);
                        },
                        decoration: InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Fadlan geli passworkaaga";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          context.read<LoginProvider>().login(context);
                        }
                        ;
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(357, 64),
                        backgroundColor: btnclr,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "login",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text("Create new account"),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterScreen()));
                            },
                            child: Text(
                              "Sign up",
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
        ),
      );
    });
  }
}
