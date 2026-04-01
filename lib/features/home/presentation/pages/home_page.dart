import 'package:flutter/material.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:market_place_app/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:auto_route/auto_route.dart';

// @AutoRoute()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _productsBloc = getIt.call<ProductBloc>();

  @override
  void initState() {
    _productsBloc.add(LoadedProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('ERROR')));
                }
              },
              bloc: _productsBloc,
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is LoadedState) {
                  final products = state.listProductsModel.products;
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(products[index].title),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: CachedNetworkImage(
                            imageUrl: products[index].images.first,
                            fit: BoxFit.cover,
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            _productsBloc.add(
                              AddToCartEvent(productModel: products[index]),
                            );
                          },
                          child: Icon(Icons.favorite),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: Text('State Error'));
              },
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: BlocSelector<ProductBloc, ProductState, int>(
              bloc: _productsBloc,
              selector: (state) =>
                  state is LoadedState ? state.cartItems.length : 0,
              builder: (context, count) {
                if (count == 0) return const SizedBox.shrink();
                return Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.deepPurple,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'В корзине $count товаров',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(Icons.shopping_cart, color: Colors.white),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
