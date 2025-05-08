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
    
  }
}
