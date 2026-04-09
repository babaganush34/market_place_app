import 'package:json_annotation/json_annotation.dart';
import 'package:market_place_app/features/home/data/models/product_model.dart';
import 'package:market_place_app/core/types/typedef.dart';

part 'list_products_model.g.dart';

@JsonSerializable()
class ListProductsModel {
  ListProductsModel(this.products);

  final List<ProductModel> products;

  factory ListProductsModel.fromJson(JSON json) =>
      _$ListProductsModelFromJson(json);
}
