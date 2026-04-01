import 'package:dartz/dartz.dart';
import 'package:market_place_app/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
