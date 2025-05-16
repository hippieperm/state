import 'package:state/features/post_list/domain/models/town_life_post.dart';
import 'package:state/features/post_list/domain/models/category.dart';

class PostService {
  // 싱글톤으로 구성
  static final PostService _instance = PostService._internal();
  factory PostService() => _instance;
  PostService._internal();

  static const int pageSize = 10;
  int _currentPage = 0;
  bool _hasMore = true;
  final List<TownLifePost> _cachedPosts = [];

  // 초기 게시물 가져오기
  Future<List<TownLifePost>> fetchInitialPosts() async {
    // API 요청을 현실적으로 만들기 위해 지연 추가
    await Future.delayed(const Duration(milliseconds: 800));
    _currentPage = 0;
    _hasMore = true;
    _cachedPosts.clear();

    // 실제 구현에서는 Firebase에서 데이터를 가져옵니다
    // final snapshot = await FirebaseFirestore.instance
    //     .collection('posts')
    //     .orderBy('createdAt', descending: true)
    //     .limit(pageSize)
    //     .get();

    // final posts = snapshot.docs
    //     .map((doc) => TownLifePost.fromMap({...doc.data(), 'id': doc.id}))
    //     .toList();

    final posts = generateDummyPosts(pageSize, startIndex: 0);
    _cachedPosts.addAll(posts);
    _currentPage++;

    return posts;
  }

  // 추가 게시물 가져오기 (무한 스크롤용)
  Future<List<TownLifePost>> fetchMorePosts() async {
    if (!_hasMore) {
      return [];
    }

    // API 요청을 현실적으로 만들기 위해 지연 추가
    await Future.delayed(const Duration(milliseconds: 800));

    // 이 예제에서는 전체 데이터가 100개로 제한됩니다
    if (_currentPage * pageSize >= 100) {
      _hasMore = false;
      return [];
    }

    // 실제 구현에서는 Firebase에서 데이터를 가져옵니다
    // final lastPost = _cachedPosts.last;
    // final snapshot = await FirebaseFirestore.instance
    //     .collection('posts')
    //     .orderBy('createdAt', descending: true)
    //     .startAfter([lastPost.createdAt])
    //     .limit(pageSize)
    //     .get();

    // final posts = snapshot.docs
    //     .map((doc) => TownLifePost.fromMap({...doc.data(), 'id': doc.id}))
    //     .toList();

    final posts =
        generateDummyPosts(pageSize, startIndex: _currentPage * pageSize);
    _cachedPosts.addAll(posts);
    _currentPage++;

    return posts;
  }

  // 현재 캐시된 게시물 가져오기
  List<TownLifePost> getCachedPosts() {
    return List.unmodifiable(_cachedPosts);
  }

  // 추가 게시물 존재여부
  bool get hasMorePosts => _hasMore;

  // 특정 지역에 맞게 필터링
  List<TownLifePost> filterByRegion(String regionId, String? subRegion) {
    return _cachedPosts.where((post) {
      if (regionId != post.regionId) {
        return false;
      }
      if (subRegion != null && subRegion != post.subRegion) {
        return false;
      }
      return true;
    }).toList();
  }

  // 특정 카테고리에 맞게 필터링
  List<TownLifePost> filterByCategory(TownLifeCategory category) {
    if (category == TownLifeCategory.all) {
      return _cachedPosts;
    }
    return _cachedPosts.where((post) => post.categoryEnum == category).toList();
  }

  // 게시물 생성 (파이어베이스 연동 시 사용)
  Future<void> createPost(TownLifePost post) async {
    // 실제 구현에서는 Firebase에 데이터를 저장합니다
    // await FirebaseFirestore.instance
    //     .collection('posts')
    //     .add(post.toMap());

    // 더미 구현에서는 로컬 캐시에 추가
    _cachedPosts.insert(0, post);
  }

  // 게시물 업데이트 (파이어베이스 연동 시 사용)
  Future<void> updatePost(String id, TownLifePost post) async {
    // 실제 구현에서는 Firebase에 데이터를 업데이트합니다
    // await FirebaseFirestore.instance
    //     .collection('posts')
    //     .doc(id)
    //     .update(post.toMap());
  }

  // 게시물 삭제 (파이어베이스 연동 시 사용)
  Future<void> deletePost(String id) async {
    // 실제 구현에서는 Firebase에서 데이터를 삭제합니다
    // await FirebaseFirestore.instance
    //     .collection('posts')
    //     .doc(id)
    //     .delete();
  }
}
