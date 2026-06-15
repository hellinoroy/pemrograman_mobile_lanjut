import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:uts/pages/homepage.dart';
import 'package:uts/pages/project.dart';

void main() {
  runApp(const MyApp());
}

// final _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Homepage(),
//     ),
//     GoRoute(
//       path: '/project/:name',
//       builder: (context, state) {
//         final name = state.pathParameters['name']!;
//         return Project(name: name);
//       },
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     routerConfig: _router,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: Text(pizzaString),
    );
  }

  Future readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    setState(() {
      pizzaString = myString;
    });
  }


}
