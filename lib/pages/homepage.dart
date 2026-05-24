import 'package:flutter/material.dart';
import 'package:tb/widgets/body.dart';
import 'package:tb/widgets/header.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          const Body(),
        ],
      )
    );
  }


}