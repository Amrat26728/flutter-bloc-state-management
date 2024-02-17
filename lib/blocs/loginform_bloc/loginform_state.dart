sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String message;
  LoginSuccessState({required this.message});
}

final class LoginFailedState extends LoginState {
  final String error;
  LoginFailedState({required this.error});
}
