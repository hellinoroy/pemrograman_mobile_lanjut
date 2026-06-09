import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal    
  ];


// async* menandakan asynchronous generator, sehingga dapat menggunakan yield dan yield*
// yield* menandakan stream berterus, Stream.periodic membuat stream dalam interval 1 detik

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
      }
    );
  }


}