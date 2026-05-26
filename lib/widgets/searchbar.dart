import 'package:flutter/material.dart';

class CustomSearchAnchor extends StatefulWidget {
  const CustomSearchAnchor({super.key});

  @override
  State<CustomSearchAnchor> createState() => _CustomSearchAnchorState();
}

class _CustomSearchAnchorState extends State<CustomSearchAnchor> {
  final SearchController _controller = SearchController();

  final List<String> items = const [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];

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
          searchController: _controller,
          barHintText: 'Search fruits...',
          barLeading: const Icon(Icons.search),

          suggestionsBuilder: (context, controller) {
            final results = items
                .where(
                  (item) => item
                      .toLowerCase()
                      .contains(controller.text.toLowerCase()),
                )
                .toList();

            return results.map(
              (item) => ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}