import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal    
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
      }
    );
  }

}
class NumberStream {

  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
 

  // final StreamController<int> controller = StreamController<int>();
  // void addNumberToSink(int newNumber) {
  //   controller.sink.add(newNumber);
  // }

  // void close() {
  //   controller.close();
  // }

  // void addError() {
  //   controller.sink.addError('error');
  // }

}