import 'package:flutter/material.dart';
import 'package:state/models/item.dart';
import 'package:state/viewmodels/item_view_model.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final ItemViewModel viewModel;
  final VoidCallback onLike;

  const ItemTile({
    super.key,
    required this.item,
    required this.viewModel,
    required this.onLike,
  });

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
