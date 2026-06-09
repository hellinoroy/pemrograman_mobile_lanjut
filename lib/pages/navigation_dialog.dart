import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationDialogState();
  
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showColorDialog(context);
          }, 
          child: const Text('Change Color')),
      ),
    );
  }

  void _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: [
            TextButton(
              onPressed: () {
                color = Colors.red.shade700;
                Navigator.pop(context, color);
              }, 
              child: const Text('Red')
            ),
            TextButton(
              onPressed: () {
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              }, 
              child: const Text('Green')
            ),
            TextButton(
              onPressed: () {
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              }, 
              child: const Text('Blue')
            ),
          ],
        );
      }
    );

    setState(() {});
  }






}