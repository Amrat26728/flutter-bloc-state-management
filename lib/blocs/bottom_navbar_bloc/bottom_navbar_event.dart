sealed class BottomNavbarEvent {}

final class BottomNavbarChangeEvent extends BottomNavbarEvent {
  final int index;

  BottomNavbarChangeEvent({required this.index});
}