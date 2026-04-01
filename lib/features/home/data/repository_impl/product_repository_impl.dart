import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/error/failure.dart';
import 'package:market_place_app/features/home/data/datasources/list_products_api.dart';
import 'package:market_place_app/features/home/data/models/list_products_model.dart';
import 'package:market_place_app/features/home/domain/repository/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ListProductsApi listProductsApi;

  ProductRepositoryImpl(this.listProductsApi);

  @override
  Future<Either<Failure, ListProductsModel>> getProductsList() async {
    try {
      final list = await listProductsApi.getProductsList();
      return Right(list);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: (e.response?.data is Map)
              ? e.response?.data['message'] ?? 'Server error'
              : e.response?.data?.toString() ?? 'Server error',
        ),
      );
    } catch (e) {
      return Left(UnimplementedFailure(message: e.toString()));
    }
  }
}
