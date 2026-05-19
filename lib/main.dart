import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uts/pages/beranda.dart';
import 'package:uts/pages/cari.dart';
import 'package:uts/pages/saya.dart';
import 'package:uts/routes.dart';
import 'package:uts/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

final _routerKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: Routes.beranda,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Navbar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.beranda,
              builder: (context, state) => const Beranda(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cari,
              builder: (context, state) => const Cari(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.saya,
              builder: (context, state) => const Saya(),
            ),
          ],
        ),
      ],
    ),



    // GoRoute(
    //   path: '/project/:name',
    //   builder: (context, state) {
    //     final name = state.pathParameters['name']!;
    //     return Project(name: name);
    //   },
    // ),
  ],
);




class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFCAA3E2), 
        ),
      ),
    );
  }
}
