
import 'package:flutter/material.dart';
import 'package:tb/widgets/item_card.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String imagePath;

  Product({required this.id, required this.name, required this.price, required this.imagePath});
}

class Categories extends StatelessWidget {
  final String categoriesName;
  Categories({super.key, required this.categoriesName});

  List dummyData() {
    switch(categoriesName){
      case 'Woven Solid':
        return [
          Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
          Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
          Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
          Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  imagePath: 'assets/cloth/RibKnit02.jpeg'),
        ];
      case 'Woven Knit':
        return [
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
        ];
      case 'Knit Solid':
        return [
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
          Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  imagePath: 'assets/cloth/PrimeScuba.jpeg'),
        ];
      case 'Knit Motif':
        return [
          Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
          Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
          Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
          Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  imagePath: 'assets/cloth/Sakura.jpeg'),
        ];
      default:
        return [];
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesName),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: dummyData().length,
                padding: const EdgeInsets.all(16),
              
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220, 
                  childAspectRatio: 0.7,  
                  crossAxisSpacing: 10,   
                  mainAxisSpacing: 10,   
                  mainAxisExtent: 310.0,
                ),
                
                itemBuilder: (context, index) {
                  final item = dummyData()[index];
                  
                  return ItemCard(
                    cardText: item.name,
                    cardPrice: item.price,
                    targetLocation: item.id,
                    cardImage: Image.asset(item.imagePath, fit: BoxFit.cover), 
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
  
}