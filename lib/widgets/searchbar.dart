import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tb/models/product.dart';
import 'package:tb/services/product_service.dart';

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

        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) {
          if (controller.text.isEmpty) {
            return [];
          }

          return [
            FutureBuilder<List<Product>>(
              future:
                  ProductService
                      .searchProducts(
                controller.text,
              ),

              builder: (
                context,
                snapshot,
              ) {
                if (
                    snapshot.connectionState ==
                    ConnectionState
                        .waiting) {
                  return const Padding(
                    padding:
                        EdgeInsets.all(
                      20,
                    ),

                    child:
                        Center(
                      child:
                          CircularProgressIndicator(),
                    ),
                  );
                }

                if (
                    snapshot.hasError) {
                  return const ListTile(
                    title:
                        Text(
                      'Search failed',
                    ),
                  );
                }

                final products =
                    snapshot.data ??
                        [];

                if (
                    products
                        .isEmpty) {
                  return const ListTile(
                    title:
                        Text(
                      'No result',
                    ),
                  );
                }

                return Column(
                  mainAxisSize:
                      MainAxisSize.min,

                  children:
                      products
                          .map(
                            (
                              item,
                            ) =>
                                ListTile(
                              title:
                                  Text(
                                item.name,
                              ),

                              onTap:
                                  () {
                                context.push(
                                  '/detail/${item.id}',
                                );
                              },
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ];
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