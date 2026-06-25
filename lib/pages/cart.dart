import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart'; // Required for Rupiah formatting

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late Future<List<dynamic>> _cartFuture;

  @override
  void initState() {
    super.initState();
    _loadCartData();
  }

  // Helper to trigger UI updates when data changes
  void _loadCartData() {
    setState(() {
      _cartFuture = _getCartData();
    });
  }

  Future<List<dynamic>> _getCartData() async {
    final prefs = await SharedPreferences.getInstance();
    String? existingCartString = prefs.getString('keranjang');
    if (existingCartString != null) {
      return jsonDecode(existingCartString);
    }
    return [];
  }

  // Helper function to format numbers to Rupiah currency style
  String _formatRupiah(num amount) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0, // Set to 2 if you explicitly want ",00" decimals
    ).format(amount);
  }

  // Updates the quantity of a specific item or removes it if quantity drops below 1
  Future<void> _updateQuantity(int productId, int change) async {
    final prefs = await SharedPreferences.getInstance();
    String? existingCartString = prefs.getString('keranjang');
    
    if (existingCartString != null) {
      List<dynamic> cartList = jsonDecode(existingCartString);
      int index = cartList.indexWhere((item) => item['id'] == productId);

      if (index != -1) {
        cartList[index]['jumlah'] += change;
        
        // If amount drops to 0 or less, remove it entirely
        if (cartList[index]['jumlah'] <= 0) {
          cartList.removeAt(index);
        }

        await prefs.setString('keranjang', jsonEncode(cartList));
        _loadCartData(); // Refresh the list
      }
    }
  }

  // Directly removes an item regardless of quantity
  Future<void> _removeItem(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    String? existingCartString = prefs.getString('keranjang');
    
    if (existingCartString != null) {
      List<dynamic> cartList = jsonDecode(existingCartString);
      cartList.removeWhere((item) => item['id'] == productId);

      await prefs.setString('keranjang', jsonEncode(cartList));
      _loadCartData(); // Refresh the list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _cartFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final cartItems = snapshot.data ?? [];
          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Keranjang kamu masih kosong.'),
            );
          }

          num totalHarga = 0;
          for (var item in cartItems) {
            totalHarga += (item['harga'] ?? 0) * (item['jumlah'] ?? 0);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final num itemTotal = (item['harga'] ?? 0) * (item['jumlah'] ?? 0);
                    final int productId = item['id'];

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Product Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['nama'] ?? 'Produk Tanpa Nama',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${_formatRupiah(item['harga'] ?? 0)} / kg',
                                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Subtotal: ${_formatRupiah(itemTotal)}',
                                    style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Quantity Controls & Delete Action
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, color: Colors.orange),
                                  onPressed: () => _updateQuantity(productId, -1),
                                ),
                                Text(
                                  '${item['jumlah']}',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline, color: Colors.orange),
                                  onPressed: () => _updateQuantity(productId, 1),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                                  onPressed: () => _removeItem(productId),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Total Summary and Buy Button
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Pembayaran:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _formatRupiah(totalHarga),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Beli Sekarang',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}