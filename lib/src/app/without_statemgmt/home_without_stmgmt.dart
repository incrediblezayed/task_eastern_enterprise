import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_eastern_enterprise/src/shared/todo_tile.dart';

class HomeWithoutStateMgmt extends StatefulWidget {
  const HomeWithoutStateMgmt({super.key});

  @override
  State<HomeWithoutStateMgmt> createState() => _HomeWithoutStateMgmtState();
}

class _HomeWithoutStateMgmtState extends State<HomeWithoutStateMgmt> {
  late List<String> todos = [];

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        todos = value.getStringList('todos') ?? [];
      });
    });
    super.initState();
  }

  TextEditingController todoController = TextEditingController();

  void addTodo(String todo) {
    setState(() {
      todos.add(todo);
    });
    SharedPreferences.getInstance().then((value) {
      value.setStringList('todos', todos);
    });
    todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Without State Management'),
        ),
        body: Column(
          children: [
            TextField(
                controller: todoController,
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    addTodo(value);
                  }
                }),
            ElevatedButton(
              onPressed: () {
                if (todoController.text.isNotEmpty) {
                  addTodo(todoController.text);
                }
              },
              child: const Text('Add Todo'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TodoTile(
                    title: todos[index],
                    delete: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                      SharedPreferences.getInstance().then((value) {
                        value.setStringList('todos', todos);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
