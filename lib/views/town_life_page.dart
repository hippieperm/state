import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/town_life_post.dart';
import 'package:state/view_models/town_life_view_model.dart';
import 'package:state/views/components/category_selector.dart';
import 'package:state/views/components/region_selector.dart';
import 'package:state/views/components/town_life_post_item.dart';

class TownLifePage extends ConsumerStatefulWidget {
  const TownLifePage({super.key});

  @override
  ConsumerState<TownLifePage> createState() => _TownLifePageState();
}

class _TownLifePageState extends ConsumerState<TownLifePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    // 초기 게시물 가져오기
    Future.microtask(
        () => ref.read(townLifeStateProvider.notifier).fetchInitialPosts());

    // 스크롤 이벤트 감지
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤 이벤트 리스너
  void _scrollListener() {
    if (_isLoadingMore) return;

    final townLifeState = ref.read(townLifeStateProvider);
    if (!townLifeState.hasMorePosts) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _isLoadingMore = true;
      ref.read(townLifeStateProvider.notifier).fetchMorePosts().then((_) {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final townLifeState = ref.watch(townLifeStateProvider);
    final filteredPosts = ref.watch(filteredPostsProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:
            const Text('소소한동네', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 지역 선택기
          const RegionSelector(),
          // 카테고리 선택기
          const CategorySelector(),

          // 게시물 리스트
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(townLifeStateProvider.notifier).fetchInitialPosts(),
              child: townLifeState.isLoading && filteredPosts.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : filteredPosts.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.article_outlined,
                                  size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 16),
                              Text(
                                '게시물이 없습니다',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: filteredPosts.length +
                              (townLifeState.hasMorePosts ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == filteredPosts.length) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                            final post = filteredPosts[index];
                            return TownLifePostItem(
                              post: post,
                              index: index,
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFF7B8E),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
