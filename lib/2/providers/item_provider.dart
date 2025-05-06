import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';

final itemProvider =
    StateNotifierProvider<ItemNotifier, List<Item>>((ref) => ItemNotifier());

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}
