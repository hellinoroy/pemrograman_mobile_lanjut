

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Navbar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const Navbar({required this.navigationShell, super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}


class _NavbarState extends State<Navbar> {
  int _previousIndex = 0;

  @override
  void didUpdateWidget(covariant Navbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationShell.currentIndex != widget.navigationShell.currentIndex) {
      _previousIndex = oldWidget.navigationShell.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentIndex = widget.navigationShell.currentIndex;
    final bool movingForward = currentIndex >= _previousIndex;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        transitionBuilder: (Widget child, Animation<double> animation) {
          final double offsetDirection = movingForward ? 0.08 : -0.08;
          final isIncoming = child.key == ValueKey<int>(currentIndex);


          final Widget transitionChild = isIncoming 
              ? child 
              : SizedBox(key: child.key);

          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(isIncoming ? offsetDirection : -offsetDirection, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: transitionChild,
            ),
          );
        },
        child: SizedBox(
          key: ValueKey<int>(currentIndex),
          child: widget.navigationShell,
        ),
      ), 
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
            currentIndex: currentIndex,
            onTap: (index) {
              if (index == 2) {
                widget.navigationShell.goBranch(index, initialLocation: true);
              } else {
                widget.navigationShell.goBranch(index);
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



// class Navbar extends StatelessWidget {
//   final StatefulNavigationShell navigationShell;

//   const Navbar({required this.navigationShell, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
    
//     return Scaffold(
//       body: navigationShell, 
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           splashFactory: NoSplash.splashFactory,
//           highlightColor: Colors.transparent,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border(
//               top: BorderSide(
//                 color: colors.primary,
//                 width: 0.0
//               )
//             )
//           ),
//           child: BottomNavigationBar(
//             currentIndex: navigationShell.currentIndex,
//             onTap: (index) {
//               if (index == 2) {
//                 navigationShell.goBranch(index, initialLocation: true);
//               } else {
//                 navigationShell.goBranch(index);
//               }
//             },
//             selectedItemColor: colors.primary,
//             unselectedItemColor: Colors.grey,
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
//               BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
//             ],
//           ),
//         )
//       ),
//     );
//   }

// }