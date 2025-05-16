import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:state/features/post_list/presentation/pages/town_life_page.dart';

// Firebase 사용 여부를 결정하는 플래그
const bool useFirebase = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화 (useFirebase가 true인 경우에만 시도)
  /*
  if (useFirebase) {
    try {
      await Firebase.initializeApp();
      print('Firebase 초기화 성공');
    } catch (e) {
      print('Firebase 초기화 실패: $e');
    }
  } else {
    print('Firebase를 사용하지 않는 모드로 실행합니다.');
  }
  */

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const TownLifePage(),
    );
  }
}
