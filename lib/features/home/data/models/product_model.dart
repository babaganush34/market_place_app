import 'package:json_annotation/json_annotation.dart';
import 'package:market_place_app/core/types/types.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel(this.id, this.title, this.images);

  final int id;
  final String title;
  final List<String> images;

  factory ProductModel.fromJson(JSON json) => _$ProductModelFromJson(json);
}
