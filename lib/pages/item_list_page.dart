import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
import '../providers/item_provider.dart';

class ItemListPage extends ConsumerWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    final cnt = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: Icon(
                item.isLiked ? Icons.favorite : Icons.favorite_border,
                color: item.isLiked ? Colors.red : null,
              ),
              onPressed: () {
                ref.read(itemProvider.notifier).toggleLike(item.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(
              Item(id: DateTime.now().toString(), name: 'New Item $cnt'));
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
