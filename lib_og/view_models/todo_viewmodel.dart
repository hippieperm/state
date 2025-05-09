import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_item.dart';

class TodoViewmodel extends StateNotifier<List<TodoItem>> {
  TodoViewmodel(super.state);

  // 로직들을 구성
  void addTodo() {}
  void removeTodo() {}
  void completeTodo() {}
}

// 물론 여기에 Riverpod의 문법이 들어가야겠지만 


// 1. model 만들기
// 2. view model 클래스 만들어서 빈 로직 함수만 만들기
// 3. Riverpod 문법 적용하기
// 4. View랑 연결하기