import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_state_management/models/todo_model.dart';
import 'package:bloc_state_management/screens/todo/add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final todo = state[index];
              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.createdAt.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTodo()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
