import 'package:flutter/material.dart';
import 'package:tomb_stone/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tomb Stone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ), // your global background

      home: LoginPage(),
    );
  }
}
