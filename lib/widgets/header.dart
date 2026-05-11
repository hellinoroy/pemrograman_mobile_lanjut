import 'package:flutter/material.dart';
class Header extends StatelessWidget {

  const Header({super.key});

  BoxDecoration _background() {
    return BoxDecoration(
      color: Colors.blue[50], 
      borderRadius: BorderRadius.circular(12), 
      border: Border.all(color: Colors.blue.shade100),
    );
  }

  Padding _nama() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Ryo Marchellino', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )
      ),
    );
  }

  CircleAvatar _fotoProfil() {
    return CircleAvatar(
      radius: 105,
      backgroundColor: Colors.blue, 
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('assets/foto.jpg'),
      ),
    );
  }

  IntrinsicWidth _kontak() {
    return IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BarisIconTeks(icon: Icons.email_rounded, text: 'marchellinoryo@gmail.com'),
                BarisIconTeks(icon: Icons.phone, text: '0882-1059-4135'),
                BarisIconTeks(icon: Icons.house, text: 'Jakarta Barat, 11260'),
              ],
            ),
          );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: _background(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          _nama(),
          _fotoProfil(),
          const SizedBox(height: 16),
          _kontak(),
        ],
      ),
    );
  }
}

class BarisIconTeks extends StatelessWidget {

  final IconData icon;
  final String text;

  const BarisIconTeks({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(text)
        ],  
      ),
    );
  }
}