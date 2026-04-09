import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';
import 'package:market_place_app/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;

  AuthBloc(LoginUsecase loginUsecase)
    : _loginUsecase = loginUsecase,
      super(AuthInitial()) {
    on<LoginSubmitted>(_onLogin);
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(LoadingState());

    final result = await _loginUsecase.call(
      LoginModel(event.username, event.password),
    );

    result.fold(
      (error) => emit(AuthError(error.toString())),
      (authData) => emit(Authenticated(authData)),
    );
  }
}
