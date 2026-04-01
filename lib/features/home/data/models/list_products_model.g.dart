// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductsModel _$ListProductsModelFromJson(Map<String, dynamic> json) =>
    ListProductsModel(
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductsModelToJson(ListProductsModel instance) =>
    <String, dynamic>{'products': instance.products};
