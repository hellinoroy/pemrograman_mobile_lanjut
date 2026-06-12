
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<Cart> {
  List<dynamic> keranjang = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadKeranjang();
  }

  Future<void> loadKeranjang() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('keranjang');

    if (data != null) {
      keranjang = [jsonDecode(data)];
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : keranjang.isEmpty
              ? const Center(
                  child: Text('Keranjang kosong'),
                )
              : ListView.builder(
                  itemCount: keranjang.length,
                  itemBuilder: (context, index) {
                    final item = keranjang[index];

                    final String barang = item['barang'] ?? '';
                    final List<dynamic> varian =
                        item['varian'] ?? [];

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              barang,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            ...varian.map((v) {
                              return ListTile(
                                dense: true,
                                contentPadding:
                                    EdgeInsets.zero,
                                title: Text(
                                  'Warna: ${v['warna']}',
                                ),
                                trailing: Text(
                                  'Qty: ${v['qty']}',
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}