import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
import '../providers/item_provider.dart';

// 아이템 뷰모델 클래스
class ItemViewModel {
  final Ref ref;

  ItemViewModel(this.ref);

  // 모든 아이템 가져오기
  List<Item> getAllItems() {
    return ref.read(itemsProvider);
  }

  // 아이템 좋아요 토글
  void toggleFavorite(int id) {
    ref.read(itemsProvider.notifier).toggleFavorite(id);
  }

  // 좋아요된 아이템만 필터링
  List<Item> getFavoriteItems() {
    return ref.read(itemsProvider).where((item) => item.isFavorite).toList();
  }

  // 아이템 하나 가져오기
  Item? getItemById(int id) {
    return ref.read(itemsProvider.notifier).getItemById(id);
  }
}

// 뷰모델 프로바이더
final itemViewModelProvider = Provider<ItemViewModel>((ref) {
  return ItemViewModel(ref);
});
