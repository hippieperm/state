import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/town_life_post.dart';

// 현재 선택된 카테고리를 관리하는 프로바이더
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// 카테고리 목록 프로바이더
final categoriesProvider = Provider<List<String>>((ref) => [
      '전체',
      '우리동네질문',
      '동네소식',
      '해주세요',
      '일상',
      '동네맛집',
      '분실/실종',
      '동네모임',
      '같이해요',
    ]);

// 좋아요 상태를 관리하는 프로바이더
final likedPostsProvider =
    StateNotifierProvider<LikedPostsNotifier, Map<int, bool>>((ref) {
  return LikedPostsNotifier();
});

// 좋아요 상태 관리를 위한 Notifier
class LikedPostsNotifier extends StateNotifier<Map<int, bool>> {
  LikedPostsNotifier() : super({});

  void toggleLike(int index) {
    final currentState = Map<int, bool>.from(state);
    currentState[index] = !(currentState[index] ?? false);
    state = currentState;
  }

  bool isLiked(int index) {
    return state[index] ?? false;
  }
}

// 필터링된 게시물 목록 프로바이더
final filteredPostsProvider = Provider<List<TownLifePost>>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (selectedCategory == null || selectedCategory == '전체') {
    return dummyTownLifePosts;
  }

  return dummyTownLifePosts
      .where((post) => post.category == selectedCategory)
      .toList();
});
