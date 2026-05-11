import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  Widget section(Text sectionName, Container sectionContainer) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionName,
          Divider(),
          sectionContainer,
        ],
      ),
    );
  }

  Container _summaryText() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Text(
        textAlign: TextAlign.justify,
        'Web Developer dengan pengalaman dalam membangun aplikasi web full-stack, dan model prediksi berbasis machine learning. Terampil menggunakan React.js, Tailwind CSS, Laravel, Express.js, MySQL. Berpengalaman dalam mengembangkan REST API dan mengimplementasikan database design sesuai kebutuhan.'
      ),
    );
  }

  Container _educationText() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Teknik Informatika – Universitas Dian Nusantara'),
          Text('IPK: 3.73 / 4.00'),
          Text('2021 – Sekarang', textScaler: TextScaler.linear(0.9), style: TextStyle(color: Colors.grey))
        ]
      ),
    );
  }

  Container _experienceText() {
    Column ci3 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CodeIgniter 3'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), 
            Expanded(
              child: Text('Mengembangkan sistem pengiriman email secara asinkron.', textAlign: TextAlign.justify),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), 
            Expanded(
              child: Text('Mengoptimalkan algoritma aplikasi untuk meningkatkan performa', textAlign: TextAlign.justify),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), 
            Expanded(
              child: Text('Memperbaiki bug dan meningkatkan stabilitas sistem', textAlign: TextAlign.justify),
            ),
          ],
        ),
      ],
    );

    Column filament = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Filament V4'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), // The bullet symbol
            Expanded(
              child: Text('Mengembangkan modul pada Laravel berdasarkan modul CodeIgniter 3 yang sudah ada', textAlign: TextAlign.justify),
            ),
          ],
        ),
      ],
    );

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Backend Developer Intern'),
          Text('PT Bringin Inti Teknologi'),
          Text('Oktober 2025 - Februari 2026', textScaler: TextScaler.linear(0.9), style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          ci3,
          SizedBox(height: 10),
          filament
        ],
      ),
    );
  }

  Container _skillText() {
    Row webDevelopment = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' • '), // The bullet symbol
        Expanded(
          child: Text('Web Development : HTML, CSS, Javascript, Codeigniter 4, Laravel, Filament V4, React.js, Express.js, MySQL', textAlign: TextAlign.justify),
        ),
      ],
    );

    Row machineLearning = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' • '), // The bullet symbol
        Expanded(
          child: Text('Machine Learning: Python, Tensorflow, Pytorch', textAlign: TextAlign.justify),
        ),
      ],
    );


    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          webDevelopment,
          machineLearning,
        ]
      )
    );
  }

  Container _certificationText() {
    Column bangkit = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Machine Learning Cohort Graduate - Bangkit Academy', textAlign: TextAlign.justify),
        Text('Google-led Program (GoTo & Traveloka)', textAlign: TextAlign.justify),
        Text('Januari 2025', textScaler: TextScaler.linear(0.9), style: TextStyle(color: Colors.grey)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), // The bullet symbol
            Expanded(
              child: Text('Menyelesaikan 4 bulan pelatihan Python, TensorFlow dan ML model.', textAlign: TextAlign.justify),
            ),
          ],
        ),
      ],
    );

    Column digitalent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Junior Web Developer – Digitalent Scholarship Program', textAlign: TextAlign.justify),
        Text('Kementerian Komunikasi dan Digital Republik Indonesia (Kominfo)', textAlign: TextAlign.justify),
        Text('Oktober 2022', textScaler: TextScaler.linear(0.9), style: TextStyle(color: Colors.grey)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' • '), // The bullet symbol
            Expanded(
              child: Text('Pelatihan web development menggunakan HTML, CSS, dan PHP.', textAlign: TextAlign.justify),
            ),
          ],
        ),
      ],
    );

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          bangkit,
          SizedBox(height: 10),
          digitalent
        ],
      ),
    );
  }


  Widget _buildProjectItem(BuildContext context, String title, String route, Color color) {
    return InkWell(
      onTap: () => context.push(route),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          textScaler: TextScaler.linear(0.9),
        ),
      ),
    );
  }

  Container _projects(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildProjectItem(context, "Relative Strength Index (RSI) Calculator ", "/project/rsi", Colors.blue),
          _buildProjectItem(context, "Sleepwell", "/project/sleepwell", Colors.green),
          _buildProjectItem(context, "Point of Sale", "/project/pos", Colors.orange),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        section(
          Text('Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _summaryText()
        ),
        section(
          Text('Education', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _educationText()
        ),
        section(
          Text('Experience', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _experienceText()
        ),
        section(
          Text('Skills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _skillText()
        ),
        section(
          Text('Certifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _certificationText()
        ),
        section(
          Text('Projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
          _projects(context)
        ),
      ],
    );
  }
}