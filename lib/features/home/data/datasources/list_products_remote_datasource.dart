import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/features/home/data/models/list_products_model.dart';

@Injectable()
class ListProductsRemoteDataSource {
  final Dio _dio;

  ListProductsRemoteDataSource(this._dio);

  Future<ListProductsModel> getProductsList() async {
    final response = await _dio.get('https://dummyjson.com/products');
    final data = ListProductsModel.fromJson(response.data);
    return data;
  }
}
