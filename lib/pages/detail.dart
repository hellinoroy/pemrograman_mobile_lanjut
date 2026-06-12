import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String imagePath;

  Product({required this.id, required this.name, required this.price, required this.imagePath});
}

class Warna {
  final String nama;
  final int harga;

  Warna({required this.nama, required this.harga});
}


class Detail extends StatefulWidget {
  final String id;

  const Detail({required this.id, super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  final List<Product> cards = [
    Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
    Product(id: '2', name: 'Lane Knit',  price: 'Rp 85.500',  imagePath: 'assets/cloth/LaneKnit.jpeg'),
    Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
    Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
  ];

  final List<Product> colors = [
    Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),

  ];

  @override
  Widget build(BuildContext context) {
    final foundProduct = cards.firstWhere(
      (product) => product.id == widget.id,
      orElse: () => Product(id: 'error', name: 'Tidak Ditemukan', price: '', imagePath: ''),
    );
    final colors = Theme.of(context).colorScheme;

    final backgroundColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.secondary; // Color when pressed
      }
      if (states.contains(WidgetState.disabled)) {
        return colors.tertiary; // Color when disabled
      }
      return colors.primary; // Default color
    });

    final backgroundColor2 = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.grey.shade400; // Color when pressed
      }
      if (states.contains(WidgetState.disabled)) {
        return colors.tertiary; // Color when disabled
      }
      return Colors.white; // Default color
    });

    Table detailProduk() {
      return Table(
        columnWidths: {
          0: FixedColumnWidth(120),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('Detail Produk', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text('')
            ]
          ),
          TableRow(
            children: [
              Text('Fabric Type', style: TextStyle(color: Colors.grey.shade400),),
              Text(':  Placeholder')
            ]
          ),
          TableRow(
            children: [
              Text('Fabric Content', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  Placeholder')
            ]
          ),
          TableRow(
            children: [
              Text('Harga / Yard', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  Placeholder')
            ]
          ),
          TableRow(
            children: [
              Text('Lebar Kain', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  Placeholder')
            ]
          ),
          TableRow(
            children: [
              Text('Gramasi', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  Placeholder')
            ]
          ),
          TableRow(
            children: [
              Text('Packing / Roll', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  Placeholder')
            ]
          ),
        ],
      );
    }

    FilledButton pilihWarnaModal() {
      return FilledButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            enableDrag: false,
            builder: (BuildContext context) {
              // Local list of item variants and their quantities
              List<String> variants = ['Merah', 'Biru', 'Hijau'];
              List<int> quantities = [0, 0, 0];
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Padding(
                    // Padding handles screen bottom safely, especially with keyboards
                    padding: EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Hugs content tightly
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- TOP ROW: Title & Close Button ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Varian Warna',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context), // Removes the modal
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 8),

                        // --- MIDDLE SECTION: List of counters ---
                        // Using a Flexible/Constrained element so it works inside a dynamic Column
                        Column(
                          children: List.generate(variants.length, (index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(variants[index]),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () {
                                      setModalState(() {
                                        if (quantities[index] > 0) quantities[index]--;
                                      });
                                    },
                                  ),
                                  Text(
                                    '${quantities[index]}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      setModalState(() {
                                        quantities[index]++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        // --- BOTTOM SECTION: Filled Action Button ---
                        SizedBox(
                          width: double.infinity, 
                          height: 48,
                          child: FilledButton(
                            onPressed: () async {
                    
                              List<Map<String, dynamic>> varian = [];
                              for (int i = 0; i < variants.length; i++) {
                                  if (quantities[i] > 0) {
                                  varian.add({
                                      "warna": variants[i],
                                      "qty": quantities[i],
                                  });
                                  }
                              }
                              final data = {
                                  "barang": "test", 
                                  "varian": varian,
                              };

                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'keranjang',
                                  jsonEncode(data),
                              );
                              Navigator.pop(context); 
                            },
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              '+ Keranjang',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }, 
        style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        backgroundColor: backgroundColor, 
        textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))),
        child: const Text('Pilih Warna')
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(foundProduct.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(foundProduct.imagePath, height: 300.0, width: 300.0,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Harga: ${foundProduct.price} / Kilogram', style: TextStyle(color: colors.primary, fontSize: 22, fontWeight: FontWeight.bold  ),),
                ),
                Divider(color: Colors.grey, thickness: 2, indent: 10, endIndent: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: detailProduk(),
                ),
                Divider(color: Colors.grey, thickness: 2, indent: 10, endIndent: 10),
                Padding(
                  padding: const EdgeInsetsGeometry.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 4,),
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam condimentum risus a purus vulputate, ut vestibulum purus laoreet. Nam tincidunt vestibulum auctor. Cras sit amet scelerisque lacus, sit amet lacinia massa. Integer sapien libero, sagittis ac ultrices a, efficitur in purus. Duis rhoncus porttitor imperdiet. Donec aliquet mi nec magna dictum egestas. Proin ornare eros enim, nec tempus orci fermentum vel.',textAlign: TextAlign.justify,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row( 
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: colors.primary, 
                        width: 1,         
                      ),
                      ),
                    ),
                    child: FilledButton(
                      onPressed: () => {}, 
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                        ),
                      
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                        backgroundColor: backgroundColor2, 
                        textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))),
                        child: Column(
                          children: [
                            Icon(Icons.chat_bubble_outline_outlined, color: colors.primary,),
                            const SizedBox(height: 4,),
                            Text('Request Handfeel', style: TextStyle(color: colors.primary),)
                          ],
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: pilihWarnaModal()
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
