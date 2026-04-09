import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/usecase/no_params.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';
import 'package:market_place_app/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:market_place_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final CheckAuthStatusUsecase _authStatusUsecase;
  final Talker _talker;

  AuthBloc(
    LoginUsecase loginUsecase,
    CheckAuthStatusUsecase authStatusUsecase, {
    required Talker talker,
  }) : _talker = talker,
       _authStatusUsecase = authStatusUsecase,
       _loginUsecase = loginUsecase,
       super(AuthInitial()) {
    on<LoginSubmitted>(_onLogin);
    on<AppStartedEvent>(_onAppStarted);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    _talker.info(
      'Переход из ${transition.currentState} в ${transition.nextState}',
    );
    super.onTransition(transition);
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _loginUsecase.call(
      LoginModel(event.username, event.password),
    );

    result.fold(
      (error) => emit(AuthError(error.toString())),
      (authData) => emit(Authenticated(authData)),
    );
  }

  Future<void> _onAppStarted(
    AppStartedEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _authStatusUsecase.call(NoParams());

    result.fold((error) => emit(Unauthenticated()), (isLoggedIn) {
      if (isLoggedIn) {
        return emit(AuthenticatedByToken(isLoggedIn));
      }
      return emit(Unauthenticated());
    });
  }
}
