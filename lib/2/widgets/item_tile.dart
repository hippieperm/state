import 'package:flutter/material.dart';
import '../models/item.dart';
import '../viewmodels/item_view_model.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final ItemViewModel viewModel;

  const ItemTile({Key? key, required this.item, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(viewModel.displayName),
      subtitle: Text('ID: ${item.id}'),
    );
  }
}
