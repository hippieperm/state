import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void toggleLiked(String name) {
    state = state.map((e) {
      if (e.name == name) {
        return Item(name: e.name, isLiked: true);
      }
      return e;
    }).toList();
  }
}

final itemProvider = StateNotifierProvider<ItemViewModel, List<Item>>((ref) {
  return ItemViewModel();
});

final counterProvider = StateProvider<int>((ref) {
  return 1;
});
