import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/core/usecase/usecase.dart';
import 'package:market_place_app/features/home/data/models/list_products_model.dart';
import 'package:market_place_app/features/home/domain/repository/product_repository.dart';

@lazySingleton
class GetProductsUsecase implements Usecase<ListProductsModel, void> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<Either<Failure, ListProductsModel>> call(void params) {
    return repository.getProductsList();
  }
}
