import 'package:bloc/bloc.dart';
import 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    // Simulate a delay for the login process
    await Future.delayed(const Duration(seconds: 2));

    // Validation
    if (!event.username.contains('@gmail.com')) {
      emit(LoginFailure(error: 'Username must contain @gmail.com'));
      return;
    }
    if (event.password.length < 8) {
      emit(LoginFailure(error: 'Password must be at least 8 characters long'));
      return;
    }
    if (event.rememberMe) {
      // Save login info to local storage
      // This is just a placeholder, implement actual logic as needed
    }

    // Simulate successful login
   emit(LoginSuccess());
  }
}
