import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/todo_bloc/todo_event.dart';
import 'package:bloc_state_management/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddTodoEvent>((event, emit) {
      final todo = Todo(
        name: event.name,
        createdAt: event.createdAt,
      );
      emit([...state, todo]);
    });
  }
}
