import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/view_models/item_provider.dart';
import '../models/item.dart';

// ConsumerWidget : Riverpod의 위젯
class ItemListPage extends ConsumerWidget {
  const ItemListPage({super.key});

  void toggleLike() {
    // asdasd
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref : reference의 약자 -> 전역 상태 관련 데이터가 들어있는 변수

    // ref.watch : 상태를 가져오고, 상태가 변할때마다 화면을 새로고침하겠다는 뜻
    // ref.read : 전역상태 관련 데이터를 단순하게 읽겠다는 것임

    final items = ref.watch(itemProvider); // itemProvider가 제공하는 상태값을 가져온다.

    final cnt = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: Icon(
                item.isLiked ? Icons.favorite : Icons.favorite_border,
                color: item.isLiked ? Colors.red : null,
              ),
              onPressed: () {
                // 전역상태 관련 데이터를 단순하게 읽는것
                // -> itemProvider.notifier를 단순하게 가져온다.
                final itemViewModel = (ref.read(itemProvider.notifier));
                itemViewModel.toggleLike(item.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(
              Item(id: DateTime.now().toString(), name: 'New Item $cnt'));
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
