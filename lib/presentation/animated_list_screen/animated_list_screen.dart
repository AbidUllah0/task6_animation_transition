import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  _AnimatedListScreenState createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final List<String> _items = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  // Method to add item
  void _addItem() {
    final newItem = "Item ${_items.length + 1}";
    _items.insert(0, newItem);
    _listKey.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 500));
  }

  // Method to remove item
  void _removeItem(int index) {
    final removedItem = _items[index];
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildListItem(removedItem, animation),
      duration: const Duration(milliseconds: 500),
    );
    _items.removeAt(index);
  }

  // Method to build list item with fade, slide, and scale transitions
  Widget _buildListItem(String item, Animation<double> animation) {
    return FadeTransition(
      opacity: animation, // Fade-in effect
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )), // Slide-in effect
        child: ScaleTransition(
          scale: animation, // Scale effect
          child: Card(
            child: ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeItem(_items.indexOf(item)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated List')),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return _buildListItem(_items[index], animation);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}
