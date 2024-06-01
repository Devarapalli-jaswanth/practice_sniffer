import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordButtonPressed extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordButtonPressed({required this.email});

  @override
  List<Object> get props => [email];
}


abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  const ForgotPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];
}

