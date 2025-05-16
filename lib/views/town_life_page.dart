import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/town_life_post.dart';
import 'package:state/view_models/town_life_view_model.dart';
import 'package:state/views/components/category_selector.dart';
import 'package:state/views/components/town_life_post_item.dart';

class TownLifePage extends ConsumerWidget {
  const TownLifePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredPosts = ref.watch(filteredPostsProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:
            const Text('동네생활', style: TextStyle(fontWeight: FontWeight.bold)),
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
          const CategorySelector(),
          Expanded(
            child: filteredPosts.isEmpty
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
                    itemCount: filteredPosts.length,
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];
                      return TownLifePostItem(
                        post: post,
                        index: index,
                      );
                    },
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
