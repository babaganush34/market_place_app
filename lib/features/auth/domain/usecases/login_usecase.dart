import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/core/usecase/usecase.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';
import 'package:market_place_app/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class LoginUsecase implements Usecase<AuthModel, LoginModel> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthModel>> call(LoginModel params) {
    return _repository.login(params);
  }
}
