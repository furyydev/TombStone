import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tomb_stone/pages/home_page.dart';
// import 'package:tomb_stone/pages/home_page.dart';
import 'package:tomb_stone/pages/login_page.dart';
// import 'package:tomb_stone/pages/profile_section.dart';


class AuthService extends StatelessWidget {
  const AuthService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return LoginPage();
          }
          //user logged out
        },
      ),
    );
  }
}
