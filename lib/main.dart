import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uts/httphelper.dart';
import 'package:uts/pages/pizza_detail_screen.dart';
import './model/pizza.dart';
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
  List<Pizza> myPizzas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
        body: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
              return ListView.builder(
                itemCount: (snapshot.data == null) ? 0 : snapshot. data!.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text(snapshot.data![position].pizzaName),
                    subtitle: Text(snapshot.data![position]. description + ' - € ' + snapshot.data![position].price.toString()),
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetailScreen(
                          pizza: snapshot.data![position], isNew: false)
                        )
                      );
                    },
                  );
                }
              );
          }
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PizzaDetailScreen(pizza: Pizza(id: 1, pizzaName: '', description: '', price: 1, imageUrl: ''), isNew: true,)),
            );
          }),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    List<Pizza> myPizzas = [];
    String myString = await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);

    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    return myPizzas;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile().then((value) {
  //     setState(() {
  //       myPizzas = value;
  //     });

  //   });
  // }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper(); 
    List<Pizza> pizzas = await helper.getPizzaList(); 
    return pizzas; 
  } 


}


