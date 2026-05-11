import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }


  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              /* soal 1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* soal 2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Gunung Bokong',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                  Text(
                    'Batu, Malang, Indonesia',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            /* soal 3*/
            Icon(
                Icons.star,
                color: Colors.red,
                ),
            const Text('41'),
          ],
        ),
      );
    
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Bokong adalah destinasi pendakian terbaru yang terletak di Desa Pesanggrahan, Kecamatan Batu, Kota Batu, Jawa Timur. Memiliki ketinggian sekitar 1.746 mdpl, gunung ini sering disebut sebagai "anak" dari Gunung Panderman karena lokasinya yang berdekatan dan jalurnya yang sempat beririsan di titik Latar Ombo. Sejak resmi dibuka pada September 2024, Gunung Bokong langsung menjadi favorit bagi para pendaki pemula, pecinta trail running, hingga keluarga (family hiking) karena jalur pendakiannya yang relatif landai dan ramah bagi berbagai kalangan, termasuk teman-teman disabilitas. 411221221 - Ryo Marchellino',
        textAlign: TextAlign.justify,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Ryo Marchellino 411221221',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [ 
            Image.asset(
                'images/gunung_bokong.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover
            ),
            titleSection, 
            buttonSection,
            textSection,
            ]
        ),
      ),
    );
  }
}