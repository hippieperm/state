import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';

// Riverpod : 전역 상태 관리 툴
// 상태가 필요함 -> StateNotifier<저장할 상태 타입>

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

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

// provider: 제공자
// -> Context에 있는 단 하나의 ItemViewModel을 제공하는 객체.
final itemProvider = StateNotifierProvider<ItemViewModel, List<Item>>((ref) {
  return ItemViewModel();
});

final counterProvider = StateProvider<int>((ref) => 1);

// import '../models/item.dart';

// class ItemViewModel {
//   final Item item;

//   ItemViewModel(this.item);

//   void toggleLike() {
//     item.isLiked = !item.isLiked;
//   }
// }
