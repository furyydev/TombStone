import 'package:flutter/material.dart';
import 'package:tomb_stone/pages/home_page.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(backgroundColor: Colors.black),
        SliverToBoxAdapter(child: HomePage())
      ],
      
    );
  }
}