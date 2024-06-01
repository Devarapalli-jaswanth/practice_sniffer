import 'package:bloc/bloc.dart';
import 'forgot_password_event.dart';


class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
  }

  void _onForgotPasswordButtonPressed(ForgotPasswordButtonPressed event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoading());

    // Simulate a delay for the password reset process
    await Future.delayed(const Duration(seconds: 2));

    // Validation
    if (!event.email.contains('@gmail.com')) {
      emit(const ForgotPasswordFailure(error: 'Username must contain @gmail.com'));
      return;
    }

    // Simulate successful password reset
    emit(ForgotPasswordSuccess());
  }
}
