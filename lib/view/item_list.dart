import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';
import 'package:state/view_model/item_view_model.dart';

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    final cnt = ref.watch(cntProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('item'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(Item(name: 'item'));
          ref.read(cntProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
