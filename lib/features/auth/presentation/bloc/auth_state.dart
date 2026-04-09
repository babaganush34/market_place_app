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

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  const Authenticated(this.model);

  final AuthModel model;

  @override
  List<Object> get props => [model];
}

final class Unauthenticated extends AuthState {}

final class AuthenticatedByToken extends AuthState {
  const AuthenticatedByToken(this.isLoggedIn);

  final bool isLoggedIn;

  @override
  List<Object> get props => [isLoggedIn];
}
