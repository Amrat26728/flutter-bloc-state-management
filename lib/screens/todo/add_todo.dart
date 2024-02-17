import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_state_management/blocs/todo_bloc/todo_event.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Column(
        children: [
          TextField(
            controller: todo,
            decoration: const InputDecoration(
              hintText: "Todo",
            ),
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              BlocProvider.of<TodoBloc>(context).add(
                AddTodoEvent(name: todo.text.trim(), createdAt: DateTime.now()),
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
