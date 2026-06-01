import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:uts/widgets/filter_carousel.dart';
import 'package:uts/widgets/takepicture_screen.dart';

// PRAKTIKUM 1
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// PRAKTIKUM 2
// void main() {
//   runApp(
//     const MaterialApp(
//       home: PhotoFilterCarousel(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }