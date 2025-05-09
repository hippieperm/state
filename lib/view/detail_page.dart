import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/view_model/item_view_model.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    required this.items,
    super.key,
  });

  final String items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('detail page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$items'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
