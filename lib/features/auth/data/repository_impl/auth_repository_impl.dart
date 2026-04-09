import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:market_place_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';
import 'package:market_place_app/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._remoteDatasource,
    AuthLocalDatasource localDatasource,
  ) : _localDatasource = localDatasource;

  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  @override
  Future<Either<Failure, AuthModel>> login(LoginModel model) async {
    try {
      final authModel = await _remoteDatasource.getTokens(model);
      await _localDatasource.saveTokens(authModel);
      return Right(authModel);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(UnimplementedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    try {
      final accessToken = await _localDatasource.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        return const Right(true);
      }
      return Right(false);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(UnimplementedFailure(message: e.toString()));
    }
  }
}
