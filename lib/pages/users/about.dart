import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ku saabsan Fatxi",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/logo.png"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Fatxi Maqaayad",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "La aasaasay 2012 – Maqaayadda ugu fiican magaalada!",
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "📌 Taariikhdeena",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Fatxi waa maqaayad caan ah oo la aasaasay 2012. Waxaan bilownay yool ah "
                "in aan dadka siino cunto dhadhan macaan leh, tayo sare leh, iyo adeeg "
                "wanaagsan.",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "🍽️ Waxyaabaha aan bixino",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "✅ Cunto Soomaaliyeed (Bariis, Muufo, Canjeero)\n"
                "✅ Cunto Yurub iyo Aasiya ah\n"
                "✅ Cunto caafimaad leh iyo sharaabka dabiiciga ah",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "🏆 Sababta aad noo dooranayso",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "💚 Cunto dhadhan macaan leh\n"
                "💚 Adeeg deg deg ah\n"
                "💚 Goob nadaafad leh oo qoysaska ku habboon",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Mahadsanid – kusoo dhawoow Fatxi! 🎉",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
