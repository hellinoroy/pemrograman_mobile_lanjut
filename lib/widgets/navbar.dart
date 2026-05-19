

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const Navbar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: navigationShell, 
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: colors.primary,
                width: 0.0
              )
            )
          ),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              if (index == 2) {
                navigationShell.goBranch(index, initialLocation: true);
              } else {
                navigationShell.goBranch(index);
              }
            },
            selectedItemColor: colors.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
            ],
          ),
        )
      ),
    );
  }

}