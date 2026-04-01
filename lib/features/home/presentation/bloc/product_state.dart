part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ErrorState extends ProductState {
  ErrorState({required this.message});

  final String message;
}

final class LoadingState extends ProductState {}

final class LoadedState extends ProductState {
  LoadedState({required this.listProductsModel, this.cartItems = const []});

  final ListProductsModel listProductsModel;
  final List<ProductModel> cartItems;

  LoadedState copyWith({
    ListProductsModel? listProductsModel,
    List<ProductModel>? cartItems,
  }) {
    return LoadedState(
      listProductsModel: listProductsModel ?? this.listProductsModel,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object> get props => [listProductsModel, cartItems];
}
