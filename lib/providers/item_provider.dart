import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/data/item.dart';

final itemProvider = StateNotifierProvider<ItemProvider, List<Item>>((ref) {
  return ItemProvider();
});

class ItemProvider extends StateNotifier<List<Item>> {
  ItemProvider() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void toggleLike(String id) {
    state = state.map(
      (item) {
        if (item.id == id) {
          return Item(id: item.id, name: item.name, isLiked: !item.isLiked);
        }
        return item;
      },
    ).toList();
  }
}
