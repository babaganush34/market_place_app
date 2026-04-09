part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class LoadingState extends AuthState {}

final class Authenticated extends AuthState {
  const Authenticated(this.model);

  final AuthModel model;

  @override
  List<Object> get props => [model];
}
