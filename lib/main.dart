import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:uts/pages/homepage.dart';
import 'package:uts/pages/project.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
    ),
    GoRoute(
      path: '/project/:name',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return Project(name: name);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
