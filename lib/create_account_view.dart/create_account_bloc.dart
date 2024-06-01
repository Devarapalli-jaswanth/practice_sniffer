import 'package:bloc/bloc.dart';
import 'create_account_event.dart';


class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(CreateAccountInitial()) {
    on<CreateAccountButtonPressed>(_onCreateAccountButtonPressed);
  }

  void _onCreateAccountButtonPressed(CreateAccountButtonPressed event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountLoading());

    // Simulate a delay for the account creation process
    await Future.delayed(const Duration(seconds: 2));

    // Validation
    if (!event.email.contains('@gmail.com')) {
      emit(const CreateAccountFailure(error: 'Username must contain @gmail.com'));
      return;
    }
    if (event.password.length < 8) {
      emit(const CreateAccountFailure(error: 'Password must be at least 8 characters long'));
      return;
    }
    if (event.password != event.confirmPassword) {
      emit(const CreateAccountFailure(error: 'Passwords do not match'));
      return;
    }

    // Simulate successful account creation
    emit(CreateAccountSuccess());
  }
}
