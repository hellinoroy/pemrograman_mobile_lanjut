
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String imagePath;

  Product({required this.id, required this.name, required this.price, required this.imagePath});
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

  @override
  Widget build(BuildContext context) {
    final foundProduct = cards.firstWhere(
      (product) => product.id == widget.id,
      orElse: () => Product(id: 'error', name: 'Tidak Ditemukan', price: '', imagePath: ''),
    );
    final colors = Theme.of(context).colorScheme;

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


    return Scaffold(
      appBar: AppBar(
        title: Text(foundProduct.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(foundProduct.imagePath),
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
                      backgroundColor: backgroundColor, 
                      textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))),
                      child: const Text('Pilih Warna')
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
