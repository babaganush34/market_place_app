import 'package:json_annotation/json_annotation.dart';
import 'package:market_place_app/core/types/types.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel(
    this.id,
    this.title,
    this.images,
    this.price,
    this.tags,
    this.rating,
  );

  final int id;
  final String title;
  final List<String> images;
  final double price;
  final List<String> tags;
  final double rating;

  factory ProductModel.fromJson(JSON json) => _$ProductModelFromJson(json);
}
