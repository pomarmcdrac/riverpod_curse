
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:uuid/uuid.dart';

import 'package:river_app/domain/domain.dart';

const _uuid = Uuid();

final todosProvider = StateNotifierProvider<TodosNotifier,List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(): super([
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completeAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completeAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completeAt: DateTime.now()),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completeAt: null),
  ]);

  void addTodo() {
    state = [
      ...state,
      Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completeAt: null),
    ];
  }

  void toggleTodo( String id ) {
    state = state.map((todo) {
      if (todo.id != id) return todo;
      if (todo.done) return todo.copyWith(completeAt: null);
      return todo.copyWith(completeAt: DateTime.now());
    }).toList();
  }
}