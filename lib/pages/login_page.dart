import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomb_stone/components/button.dart';
import 'package:tomb_stone/components/square_tile.dart';
import 'package:tomb_stone/components/text_feild.dart';
// import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void loginUser() async {
    //LOADING GOL GOL
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // FIREBASE AUTH
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );

    // LOADING END
    Navigator.pop(context);
  }

  void googleLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(height: 20),

                //Tombstone image
                Image.asset(
                  'lib/assets/tombstone.png',
                  height: 150,
                  width: 150,
                ),

                const SizedBox(height: 20),

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
                Mybutton(onTap: loginUser, name: 'Sign in'), //login auth

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff46474c),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: GoogleFonts.ubuntu(color: Colors.white70),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color((0xff46474c)),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //google button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySquareTile(iconPath: 'lib/assets/search.png'),

                    SizedBox(width: 15),

                    //github button
                    MySquareTile(iconPath: 'lib/assets/github_dark.png'),
                  ],
                ),

                const SizedBox(height: 30),

                //dont have an account? create one
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: GoogleFonts.ubuntu(
                        color: Color(0xff46474c),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: googleLogin, // sign auth idhar ayega
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.ubuntu(
                          color: Color(0xff4b5dff),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
