import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_eastern_enterprise/src/shared/todo_tile.dart';

import 'provider/todo_provider.dart';

class HomeWithStateMgmt extends ConsumerWidget {
  const HomeWithStateMgmt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoPro = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Without State Management'),
      ),
      body: Column(
        children: [
          TextField(
            controller: todoPro.todoController,
            onSubmitted: (value) {
              if (value.isEmpty) {
                todoPro.add();
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (todoPro.todoController.text.isNotEmpty) {
                todoPro.add();
              }
            },
            child: const Text('Add Todo'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoPro.todos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TodoTile(
                  title: todoPro.todos[index],
                  delete: () {
                    todoPro.remove(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
