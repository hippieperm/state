import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';
import 'package:state/viewmodel/item_view_model.dart';

class ItemListPage extends ConsumerWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    final cnt = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('ITEM LIST'),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          final itemInfo = item[index];

          return ListTile(
            title: Text(itemInfo.name),
            trailing: IconButton(
              onPressed: () {
                ref.read(itemProvider.notifier).toggleLiked(itemInfo.name);
              },
              icon: Icon(
                Icons.favorite,
                color: itemInfo.isLiked ? Colors.red : Colors.grey,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(Item(name: 'item $cnt'));
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
