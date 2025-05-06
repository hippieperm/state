import 'package:flutter/material.dart';
import '../models/item.dart';
import '../viewmodels/item_view_model.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final ItemViewModel viewModel;
  final VoidCallback onLike;

  const ItemTile({
    Key? key,
    required this.item,
    required this.viewModel,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
        icon: Icon(
          item.isLiked ? Icons.favorite : Icons.favorite_border,
          color: item.isLiked ? Colors.red : null,
        ),
        onPressed: onLike,
      ),
    );
  }
}
