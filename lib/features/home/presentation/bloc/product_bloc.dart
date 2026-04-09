import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/features/home/data/models/list_products_model.dart';
import 'package:market_place_app/features/home/data/models/product_model.dart';
import 'package:market_place_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'product_event.dart';
part 'product_state.dart';

@Injectable()
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase _getProductsUsecase;
  final Talker _talker;

  ProductBloc({
    required GetProductsUsecase getProductsUsecase,
    required Talker talker,
  }) : _talker = talker,
       _getProductsUsecase = getProductsUsecase,
       super(ProductInitial()) {
    on<LoadedProductsEvent>(_onLoadProducts);
    on<AddToCartEvent>(_onAddToCart);
  }

  @override
  void onTransition(Transition<ProductEvent, ProductState> transition) {
    _talker.info(
      'Переход из ${transition.currentState} в ${transition.nextState}',
    );
    super.onTransition(transition);
  }

  Future<void> _onLoadProducts(
    LoadedProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final productsList = await _getProductsUsecase.call(null);
    productsList.fold(
      (e) => emit(ErrorState(message: e.message)),
      (r) => emit(LoadedState(listProductsModel: r)),
    );
  }

  void _onAddToCart(AddToCartEvent event, Emitter<ProductState> emit) async {
    if (state is LoadedState) {
      final current = state as LoadedState;
      emit(
        current.copyWith(cartItems: [...current.cartItems, event.productModel]),
      );
    }
  }
}
