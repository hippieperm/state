import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';
import 'package:state/view_models/item_view_model.dart';

class ItemPage extends ConsumerWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    final cnt = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('item'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
              title: Text(item.name),
              trailing: IconButton(
                onPressed: () {
                  ref.read(itemProvider.notifier).isLiked(item.name);
                },
                icon: Icon(
                  Icons.favorite,
                  color: item.isLiked ? Colors.red : Colors.grey,
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(Item(name: 'ITEM $cnt'));
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
