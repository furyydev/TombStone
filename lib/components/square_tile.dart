import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {

  final String iconPath;
  const MySquareTile({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xff46474c),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xff46474c)),
      ),
      child: Image.asset(iconPath, height: 30),
    );
  }
}
