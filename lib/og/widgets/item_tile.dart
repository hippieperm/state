import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart';
import '../viewmodels/item_view_model.dart';

// 아이템 타일 컴포넌트
class ItemTile extends ConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(itemViewModelProvider);

    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
        icon: Icon(
          item.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: item.isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          viewModel.toggleFavorite(item.id);
        },
      ),
    );
  }
}
