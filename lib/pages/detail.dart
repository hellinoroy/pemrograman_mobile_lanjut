
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

    return Scaffold(
      appBar: AppBar(
        title: Text(foundProduct.name),
      ),
      body: ListView(
        children: [
          Image.asset(foundProduct.imagePath),
          Text('${foundProduct.price} / Kilogram', style: TextStyle(color: colors.primary, fontSize: 22, fontWeight: FontWeight.bold  ),)

        ],
      ),
    );
  }

}
