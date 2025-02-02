import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nala Soo Xiriir",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.phone,
                  size: 80,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Nala soo xiriir Fatxi",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "📍 Cinwaanka:",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Magaalada Muqdisho, KM4, Somalia",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "📞 Taleefanka:",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "+252 61 4 388477",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "📧 Email:",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "info@fatxirestaurant.com",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                "📩 Fariin noo soo dir",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Magacaaga",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return "Fadlan geli magacaaga";
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Emailkaaga",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return "Fadlan geli email sax ah";
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: messageController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Fariintaada",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return "Fadlan qor fariintaada";
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Fariintaada waa la diray!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            nameController.clear();
                            emailController.clear();
                            messageController.clear();
                          }
                        },
                        child: Text(
                          "DIR FARIINTA",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
