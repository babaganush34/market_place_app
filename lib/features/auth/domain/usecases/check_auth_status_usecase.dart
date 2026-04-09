import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/core/usecase/no_params.dart';
import 'package:market_place_app/core/usecase/usecase.dart';
import 'package:market_place_app/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class CheckAuthStatusUsecase implements Usecase<bool, NoParams> {
  CheckAuthStatusUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.checkAuthStatus();
  }
}
