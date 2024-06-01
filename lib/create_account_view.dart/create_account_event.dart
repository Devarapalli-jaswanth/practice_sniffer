import 'package:equatable/equatable.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class CreateAccountButtonPressed extends CreateAccountEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String role;

  const CreateAccountButtonPressed({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.role,
  });

  @override
  List<Object> get props => [email, password, confirmPassword, role];
}


abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSuccess extends CreateAccountState {}

class CreateAccountFailure extends CreateAccountState {
  final String error;

  const CreateAccountFailure({required this.error});

  @override
  List<Object> get props => [error];
}

