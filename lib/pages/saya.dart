import 'package:flutter/material.dart';

class Saya extends StatelessWidget {
  const Saya({super.key});
  
@override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity, 
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  colors.tertiary,
                  colors.secondary,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Alex Doe',
                  style: TextStyle(
                    fontSize: 18, 
                    color: Colors.white, 
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Alamat',
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Jl. Sudirman No. 123, Jakarta Pusat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Pesanan Saya'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Bantuan'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Keluar', 
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
            },
          )
        ],
      ),
    );
  }
  
}