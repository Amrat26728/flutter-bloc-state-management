import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_event.dart';
import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(BottomNavbarState(index: 0)) {
    on<BottomNavbarChangeEvent>((event, emit) {
      if (event.index == 0) {
        emit(BottomNavbarState(index: event.index));
      } else if (event.index == 1) {
        emit(BottomNavbarState(index: event.index));
      } else if (event.index == 2) {
        emit(BottomNavbarState(index: event.index));
      } else {
        emit(BottomNavbarState(index: event.index));
      }
    });
  }
}
