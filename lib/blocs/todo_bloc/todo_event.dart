sealed class TodoEvent {}

final class AddTodoEvent extends TodoEvent {
  final String name;
  final DateTime createdAt;
  AddTodoEvent({required this.name, required this.createdAt});
}
