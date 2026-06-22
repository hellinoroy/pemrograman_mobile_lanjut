import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import 'package:tb/models/product.dart';
import 'package:tb/services/product_service.dart';

import 'package:tb/widgets/item_card.dart';
import 'package:tb/widgets/searchbar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchAnchor(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => context.push('/cart'),
                  ),
                ],
              ),
            ),

            Expanded(
              child: FutureBuilder<List<Product>>(
                future: ProductService.fetchProducts(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }

                  final cards = snapshot.data ?? [];

                  if (cards.isEmpty) {
                    return const Center(
                      child: Text('No products'),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cards.length,

                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 310,
                    ),

                    itemBuilder: (context, index) {
                      final item = cards[index];

                      return ItemCard(
                        cardText: item.name,
                        cardPrice: item.price,
                        targetLocation: item.id,

                        cardImage: Image.network(
                          item.img_url,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (_, __, ___) =>
                                  const Icon(
                            Icons.image_not_supported,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}