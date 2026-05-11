import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  final String name;

  const Project({
    super.key,
    required this.name,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  
  Map<String, String> names = {
    'rsi': 'Relative Strength Index (RSI) Calculator',
    'sleepwell': 'Sleepwell',
    'pos': 'Point of Sale'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            SizedBox(height: 10),
            Text(names[widget.name]!, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/project/${widget.name}1.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/project/${widget.name}2.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/project/${widget.name}3.jpg'),
            ),
          ],
        ),
    );
  }
}