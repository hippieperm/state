import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';

// 아이템 상태를 관리하는 프로바이더
final itemsProvider = StateNotifierProvider<ItemsNotifier, List<Item>>((ref) {
  return ItemsNotifier();
});

// 아이템 상태 관리 클래스
class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]) {
    // 초기 아이템 200개 생성
    _initItems();
  }

  // 초기 아이템 생성
  void _initItems() {
    final items = List.generate(
      200,
      (index) => Item(id: index, name: '아이템 ${index + 1}'),
    );
    state = items;
  }

  // 아이템 좋아요 상태 토글
  void toggleFavorite(int id) {
    state =
        state.map((item) {
          if (item.id == id) {
            return item.copyWith(isFavorite: !item.isFavorite);
          }
          return item;
        }).toList();
  }

  // 특정 아이템 가져오기
  Item? getItemById(int id) {
    try {
      return state.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
