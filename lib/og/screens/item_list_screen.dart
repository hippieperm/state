import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart';
import '../providers/item_provider.dart';
import '../widgets/item_tile.dart';

// 아이템 리스트 화면
class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 아이템 리스트 상태를 관찰
    final items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('아이템 리스트'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // 좋아요 개수 표시
          Consumer(
            builder: (context, ref, _) {
              final favorites =
                  ref
                      .watch(itemsProvider)
                      .where((item) => item.isFavorite)
                      .length;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite),
                      const SizedBox(width: 4),
                      Text('$favorites', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(item: item);
        },
      ),
    );
  }
}
