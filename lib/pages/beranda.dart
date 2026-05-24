import 'package:flutter/material.dart';
import 'package:tb/widgets/item_card.dart';

  class Product {
    final String id;
    final String name;
    final String price;
    final String imagePath;

    Product({required this.id, required this.name, required this.price, required this.imagePath});
  }

class Beranda extends StatelessWidget {
  Beranda({super.key});

  final List<Product> cards = [
    Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
    Product(id: '2', name: 'Lane Knit',  price: 'Rp 85.500',  imagePath: 'assets/cloth/LaneKnit.jpeg'),
    Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
    Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: cards.length,
          padding: const EdgeInsets.all(16),
        
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,   
            crossAxisSpacing: 10,   
            mainAxisSpacing: 10,   
          ),
          
          itemBuilder: (context, index) {
            final item = cards[index];
            
            return ItemCard(
              cardText: item.name,
              cardPrice: item.price,
              targetLocation: item.id,
              cardImage: Image.asset(item.imagePath, fit: BoxFit.cover), 
            );
          }
        ),
      )
    );
  }
  
}