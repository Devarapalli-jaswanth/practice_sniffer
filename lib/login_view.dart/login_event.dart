// login_event.dart
abstract class LoginEvent {}

@override
  List<Object> get props => [];

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final bool rememberMe;

  LoginButtonPressed({required this.username, required this.password,required this.rememberMe,});
  List<Object> get props => [username, password, rememberMe];
}

// login_state.dart
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
  List<Object> get props => [error];
}
