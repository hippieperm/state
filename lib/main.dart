import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/item_provider.dart';
import 'viewmodels/item_view_model.dart';
import 'widgets/item_tile.dart';
import 'models/item.dart' as model_item;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final viewModel = ItemViewModel(items[index]);
          return ItemTile(
            item: items[index],
            viewModel: viewModel,
            onLike: () {
              ref.read(itemProvider.notifier).toggleLike(items[index].id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(
                model_item.Item(
                  id: DateTime.now().toString(),
                  name: 'Item ${items.length + 1}',
                ),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
