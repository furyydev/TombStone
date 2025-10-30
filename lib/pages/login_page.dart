import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Container(
        alignment: Alignment.center,      
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'TombStone',
              style: GoogleFonts.ubuntu(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Please Login to you account',
              style: GoogleFonts.ubuntu(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xff46474c),
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
