import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final VoidCallback delete;
  final String title;
  const TodoTile({Key? key, required this.title, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(onPressed: delete, icon: const Icon(Icons.delete)),
    );
  }
}
