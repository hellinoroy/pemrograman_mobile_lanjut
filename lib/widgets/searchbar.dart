import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tb/models/product.dart';

class CustomSearchAnchor extends StatefulWidget {
  const CustomSearchAnchor({super.key});

  @override
  State<CustomSearchAnchor> createState() => _CustomSearchAnchorState();
}


class _CustomSearchAnchorState extends State<CustomSearchAnchor> {
  final SearchController _controller = SearchController();

 
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (!_controller.isOpen) {
        Future.microtask(() {
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.openView();
      },
      child: AbsorbPointer(
        child: SearchAnchor.bar(
          isFullScreen: true,
          searchController: _controller,
          barHintText: 'Search...',
          barLeading: const Icon(Icons.search),

          suggestionsBuilder: (BuildContext context, SearchController controller) {
            if (controller.text.isEmpty) {
              return [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          _buildCategoryChip('Woven Solid', context, controller),
                          _buildCategoryChip('Woven Knit', context, controller),
                          _buildCategoryChip('Knit Solid', context, controller),
                          _buildCategoryChip('Knit Motif', context, controller),
                        ],
                      ),
                    ],
                  ),
                )
              ];
            } else {
                final String query = controller.text.toLowerCase();
                final List<Product> cards = [
                  Product(id: '1', name: 'Rib Knit Basic',  price: 'Rp 75.000',  img_url: 'assets/cloth/RibKnit02.jpeg'),
                  Product(id: '2', name: 'Lane Knit',  price: 'Rp 85.500',  img_url: 'assets/cloth/LaneKnit.jpeg'),
                  Product(id: '3', name: 'Prime Scuba',  price: 'Rp 110.000',  img_url: 'assets/cloth/PrimeScuba.jpeg'),
                  Product(id: '4', name: 'Sakura',  price: 'Rp 22.000',  img_url: 'assets/cloth/Sakura.jpeg'),
                ];
                
                return cards
                    .where((item) => item.name.toLowerCase().contains(query))
                    .map((item) => ListTile(
                        title: Text(item.name),
                        onTap: () {
                          context.push('detail/${item.id}');
                        },
                        ))
                    .toList();
            }
          },
        ),
      ),
    );
  }
}


// Helper helper widget for the category buttons
Widget _buildCategoryChip(String label, BuildContext context, SearchController controller) {
  return ActionChip(
    label: Text(label),
    onPressed: () {
      // controller.text = label;
      context.push('categories/$label');
    },
  );
}