import 'package:dartz/dartz.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/features/home/data/models/list_products_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, ListProductsModel>> getProductsList();
}
