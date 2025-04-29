import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/item_list_screen.dart';
import 'screens/favorite_items_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리버팟 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// 메인 화면 (탭 네비게이션)
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 탭 화면 목록
  final List<Widget> _screens = const [ItemListScreen(), FavoriteItemsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '아이템 목록'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '좋아요 목록'),
        ],
      ),
    );
  }
}

// 아이템 모델 클래스
class Item {
  final int id;
  final String name;
  bool isFavorite;

  Item({required this.id, required this.name, this.isFavorite = false});
}

// 아이템 상태를 관리하는 프로바이더
final itemsProvider = StateNotifierProvider<ItemsNotifier, List<Item>>((ref) {
  return ItemsNotifier();
});

// 아이템 상태 관리 클래스
class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]) {
    // 초기 아이템 200개 생성
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
            return Item(
              id: item.id,
              name: item.name,
              isFavorite: !item.isFavorite,
            );
          }
          return item;
        }).toList();
  }
}

// 아이템 리스트 화면
class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('아이템 리스트'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(item: item);
        },
      ),
    );
  }
}

// 아이템 타일 컴포넌트
class ItemTile extends ConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
        icon: Icon(
          item.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: item.isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          ref.read(itemsProvider.notifier).toggleFavorite(item.id);
        },
      ),
    );
  }
}
