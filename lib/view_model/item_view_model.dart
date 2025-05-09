import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void toggleLiked() {}
}
