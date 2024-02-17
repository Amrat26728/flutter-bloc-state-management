import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_event.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_state.dart';

class LoginFormBloc extends Bloc<LoginEvent, LoginState> {
  LoginFormBloc() : super(LoginInitialState()) {
    on<LoginRequestEvent>((event, emit) {
      try {
        if (event.password.length < 6) {
          emit(LoginFailedState(error: "Password is less than 6 characters."));
        } else {
          emit(LoginSuccessState(message: "Login successful"));
        }
      } catch (e) {
        emit(LoginFailedState(error: "Something internal error happend."));
      }
    });
  }
}
