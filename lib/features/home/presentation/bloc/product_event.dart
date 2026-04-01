part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoadedProductsEvent extends ProductEvent {}

final class AddToCartEvent extends ProductEvent {
  AddToCartEvent({required this.productModel});

  final ProductModel productModel;

  @override
  List<Object> get props => [productModel];
}
