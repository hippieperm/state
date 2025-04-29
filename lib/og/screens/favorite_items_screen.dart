import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart';
import '../providers/item_provider.dart';
import '../widgets/item_tile.dart';

// 좋아요한 아이템 리스트 화면
class FavoriteItemsScreen extends ConsumerWidget {
  const FavoriteItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 좋아요한 아이템만 필터링하여 가져오기
    final List<Item> favoriteItems =
        ref.watch(itemsProvider).where((item) => item.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('좋아요한 아이템'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
          favoriteItems.isEmpty
              ? const Center(
                child: Text('좋아요한 아이템이 없습니다.', style: TextStyle(fontSize: 18)),
              )
              : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = favoriteItems[index];
                  return ItemTile(item: item);
                },
              ),
    );
  }
}
