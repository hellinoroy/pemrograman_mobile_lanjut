import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tb/pages/beranda.dart';
import 'package:tb/pages/cart.dart';
import 'package:tb/pages/catagories.dart';
import 'package:tb/pages/detail.dart';
import 'package:tb/pages/login_page.dart';
import 'package:tb/pages/register_page.dart';
import 'package:tb/pages/saya.dart';
import 'package:tb/routes.dart';
import 'package:tb/services/auth_service.dart';
import 'package:tb/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

final _routerKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: Routes.beranda,

  redirect: (context, state) async {
    final loggedIn = await AuthService.isLoggedIn();

    final location = state.matchedLocation;

    final protectedRoutes = [
      Routes.cart,
      Routes.saya,
    ];

    final isProtected = protectedRoutes.any(
      (route) =>
        location.startsWith(route),
    );

    final isLogin = location == Routes.login;

    if (!loggedIn && isProtected) {
      return Routes.login;
    }

    if (loggedIn && isLogin) {
      return Routes.beranda;
    }

    return null;
  },

  routes: [
    StatefulShellRoute.indexedStack(
      builder: (
        context,
        state,
        navigationShell,
      ) {
        return Navbar(
          navigationShell:
              navigationShell,
        );
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.beranda,
              builder: (context, state) => Beranda(),
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

    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: Routes.cart,
      parentNavigatorKey: _routerKey,
      builder: (context, state) => Cart(),
    ),

    GoRoute(
      path: Routes.detail, 
      parentNavigatorKey: _routerKey, 
      builder: (context, state) { 
        final String id = state.pathParameters['id']!; return Detail(id: id); 
      }, 
    ),

    GoRoute(
      path: Routes.categories, 
      parentNavigatorKey: _routerKey, 
      builder: (context, state) { 
        final String name = state.pathParameters['name']!; 
        return Categories(categoriesName : name); 
      }, 
    ),
    
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
