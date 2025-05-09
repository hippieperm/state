import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';

final itemProvider = StateNotifierProvider<ItemViewModel, List<Item>>((ref) {
  return ItemViewModel();
});

final cntProvider = StateProvider<int>((ref) {
  return 1;
});

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void toggleLiked(String name) {
    state = state.map(
      (e) {
        if (e.name == name) {
          return Item(name: e.name, isLiked: !e.isLiked);
        }
        return e;
      },
    ).toList();
  }
}
