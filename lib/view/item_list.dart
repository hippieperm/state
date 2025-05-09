import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/view/detail_page.dart';
import '../models/item.dart';
import '../view_model/item_view_model.dart';

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
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          final items = item[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ));
            },
            child: ListTile(
              title: Text(items.name),
              trailing: IconButton(
                onPressed: () {
                  ref.read(itemProvider.notifier).toggleLiked(items.name);
                },
                icon: Icon(
                  Icons.favorite,
                  color: items.isLiked ? Colors.red : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(Item(name: 'item $cnt'));
          ref.read(cntProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
