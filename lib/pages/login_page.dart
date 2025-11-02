import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomb_stone/components/button.dart';
import 'package:tomb_stone/components/text_feild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),

              //TombStone
              Text(
                'TombStone',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 5),

              //Login text
              Text(
                'Please Login to you account',
                style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff46474c),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 30),

              //Tombstone image
              Image.asset('lib/assets/tombstone.png', height: 200, width: 200),

              const SizedBox(height: 30),

              //Email text field
              MyTextField(
                controller: usernameController,
                hinttext: 'Email',
                secure: false,
              ),

              //Password text field
              MyTextField(
                controller: passwordController,
                hinttext: 'Password',
                secure: true,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: GoogleFonts.ubuntu(
                        color: Color(0xff46474c),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //login button
              Mybutton(onTap: loginUser),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(child: Divider(thickness: 1),),
                  Text('Or', style: TextStyle(color: Colors.white),),
                  Expanded(child: Divider(thickness: 1),)
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
