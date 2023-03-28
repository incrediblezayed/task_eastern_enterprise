import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final todoProvider = ChangeNotifierProvider((ref) => TodoProvider()..init());

class TodoProvider extends ChangeNotifier {
  TextEditingController todoController = TextEditingController();
  List<String> _todos = [];

  List<String> get todos => _todos;
  set todos(List<String> todos) {
    _todos = todos;
    notifyListeners();
  }

  void add() {
    _todos.add(todoController.text);
    SharedPreferences.getInstance().then((value) {
      value.setStringList('todos', _todos);
    });
    todoController.clear();
    notifyListeners();
  }

  void remove(int index) {
    _todos.removeAt(index);
    SharedPreferences.getInstance().then((value) {
      value.setStringList('todos', _todos);
    });
    notifyListeners();
  }

  void clear() {
    _todos.clear();
    notifyListeners();
  }

  void init() {
    SharedPreferences.getInstance().then((value) {
      todos = value.getStringList('todos') ?? [];
    });
  }
}
