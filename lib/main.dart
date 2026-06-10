import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '411221221',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
        ),
        home: const StreamHomePage()
    );
  }
}

class StreamHomePage extends StatefulWidget {
    const StreamHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // Color bgColor = Colors.blueGrey;
  // int lastNumber = 0;
  // String values = '';
  // late StreamController numberStreamController;
  // late StreamSubscription subscription;
  // late StreamSubscription subscription2;
  // late StreamTransformer transformer;
  late Stream<int> numberStream;
  // late ColorStream colorStream;


  // void changeColor() async {
  //   await for (var eventColor in colorStream.getColors()) {
  //     setState(() {
  //       bgColor = eventColor;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // transformer = StreamTransformer<int, int>.fromHandlers(
    //   handleData: (value, sink) {
    //     sink.add(value * 10);
    //   },
    //   handleError: (error, trace, sink) {
    //     sink.add(-1);
    //   },
    //   handleDone: (sink) => sink.close()
    // );
    numberStream = NumberStream().getNumbers();

    // numberStream = NumberStream();
    // numberStreamController = numberStream.controller;
    // Stream stream = numberStreamController.stream.asBroadcastStream();
    // stream.transform(transformer).listen((event) {
    //   setState(() {
    //     lastNumber = event;
    //   });
    // }).onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });
  //   subscription = stream.listen((event) {
  //     setState(() {
  //       values += '$event - ';
  //     });
  //   });

  //   subscription2 = stream.listen((event) {
  //     setState(() {
  //       values += '$event - ';
  //     });
  //   });

  // subscription.onError((error) {
  //   setState(() {
  //     lastNumber = 1;
  //   });
  // });

  // subscription.onDone(() {
  //   print('onDone was called');
  // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: StreamBuilder(
        stream: numberStream, 
        initialData: 0,
        builder: ((context, snapshot) {
          if(snapshot.hasError) {
            print('Error!');
          }

          if(snapshot.hasData) {
            return Center(
              child: Text(snapshot.data.toString(), style: const TextStyle(fontSize: 96))
            );
          } else {
            return const SizedBox.shrink();
          }
        })
      )
    );
  }

  // @override
  // void dispose() {
  //   // numberStreamController.close();
  //   subscription.cancel();
  //   super.dispose();
  // }

  // void addRandomNumber() {
  //   Random random = Random();
  //   int myNum = random.nextInt(10);
  //   if(!numberStreamController.isClosed) {
  //     numberStream.addNumberToSink(myNum);
  //   } else {
  //     setState(() {
  //       lastNumber = -1;
  //     });
  //   }


  //   // numberStream.addNumberToSink(myNum);
  //   // numberStream.addError();
  // }

  // void stopStream() {
  //   numberStreamController.close();
  // }

}
