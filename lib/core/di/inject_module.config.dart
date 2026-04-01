// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasources/list_products_api.dart' as _i973;
import '../../features/home/data/repository_impl/product_repository_impl.dart'
    as _i969;
import '../../features/home/domain/repository/product_repository.dart' as _i863;
import '../../features/home/domain/usecases/get_products_usecase.dart' as _i677;
import '../../features/home/presentation/bloc/product_bloc.dart' as _i856;
import 'inject_module.dart' as _i394;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.factory<_i973.ListProductsApi>(
      () => _i973.ListProductsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i863.ProductRepository>(
      () => _i969.ProductRepositoryImpl(gh<_i973.ListProductsApi>()),
    );
    gh.lazySingleton<_i677.GetProductsUsecase>(
      () => _i677.GetProductsUsecase(gh<_i863.ProductRepository>()),
    );
    gh.factory<_i856.ProductBloc>(
      () =>
          _i856.ProductBloc(getProductsUsecase: gh<_i677.GetProductsUsecase>()),
    );
    return this;
  }
}

class _$AppModule extends _i394.AppModule {}
