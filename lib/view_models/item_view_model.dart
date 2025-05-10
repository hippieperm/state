import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void isLiked(String name) {
    state = state.map(
      (item) {
        if (item.name == name) {
          return Item(name: item.name, isLiked: !item.isLiked);
        }
        return item;
      },
    ).toList();
  }
}

final itemProvider = StateNotifierProvider<ItemViewModel, List<Item>>((ref) {
  return ItemViewModel();
});

final counterProvider = StateProvider<int>((ref) {
  return 1;
});
