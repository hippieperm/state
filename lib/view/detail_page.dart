import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/view_model/item_view_model.dart';
import '../models/item.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    required this.items,
    super.key,
  });

  final String items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsList = ref.watch(itemProvider);
    final item = itemsList.firstWhere(
      (element) => element.name == items,
      orElse: () => Item(name: 'Unknown', isLiked: false),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${item.name}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Liked: ${item.isLiked ? "Yes" : "No"}'),
              ],
            ),
            IconButton(
              icon: Icon(
                item.isLiked ? Icons.favorite : Icons.favorite_border,
                color: item.isLiked ? Colors.red : null,
              ),
              onPressed: () {
                ref.read(itemProvider.notifier).toggleLiked(item.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
