import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/item.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(Item item){
    state = [...state, item];
  }
}
