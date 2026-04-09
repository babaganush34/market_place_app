import 'package:dartz/dartz.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(LoginModel model);
}
