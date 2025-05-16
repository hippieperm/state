import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/region.dart';
import 'package:state/models/town_life_post.dart';
import 'package:state/services/post_service.dart';

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
  final townLifeState = ref.watch(townLifeStateProvider);

  if (selectedCategory == null || selectedCategory == '전체') {
    return townLifeState.posts;
  }

  return townLifeState.posts
      .where((post) => post.category == selectedCategory)
      .toList();
});

// 게시물 서비스 프로바이더
final postServiceProvider = Provider<PostService>((ref) => PostService());

// 게시물 상태 관리를 위한 State 클래스
class TownLifeState {
  final List<TownLifePost> posts;
  final bool isLoading;
  final bool hasMorePosts;
  final String? errorMessage;

  TownLifeState({
    required this.posts,
    required this.isLoading,
    required this.hasMorePosts,
    this.errorMessage,
  });

  TownLifeState copyWith({
    List<TownLifePost>? posts,
    bool? isLoading,
    bool? hasMorePosts,
    String? errorMessage,
  }) {
    return TownLifeState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      hasMorePosts: hasMorePosts ?? this.hasMorePosts,
      errorMessage: errorMessage,
    );
  }

  static TownLifeState initial() {
    return TownLifeState(
      posts: [],
      isLoading: false,
      hasMorePosts: true,
      errorMessage: null,
    );
  }
}

// 게시물 상태 프로바이더
final townLifeStateProvider =
    StateNotifierProvider<TownLifeStateNotifier, TownLifeState>((ref) {
  final postService = ref.watch(postServiceProvider);
  return TownLifeStateNotifier(postService);
});

// 게시물 상태 관리를 위한 Notifier
class TownLifeStateNotifier extends StateNotifier<TownLifeState> {
  final PostService _postService;

  TownLifeStateNotifier(this._postService) : super(TownLifeState.initial());

  // 초기 게시물 불러오기
  Future<void> fetchInitialPosts() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final posts = await _postService.fetchInitialPosts();
      state = state.copyWith(
        posts: posts,
        isLoading: false,
        hasMorePosts: _postService.hasMorePosts,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '게시물을 불러오는 중 오류가 발생했습니다.',
      );
    }
  }

  // 추가 게시물 불러오기 (무한 스크롤)
  Future<void> fetchMorePosts() async {
    if (state.isLoading || !state.hasMorePosts) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final newPosts = await _postService.fetchMorePosts();
      state = state.copyWith(
        posts: [...state.posts, ...newPosts],
        isLoading: false,
        hasMorePosts: _postService.hasMorePosts,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '추가 게시물을 불러오는 중 오류가 발생했습니다.',
      );
    }
  }
}
