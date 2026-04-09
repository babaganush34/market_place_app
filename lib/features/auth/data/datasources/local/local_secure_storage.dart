import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl(this.secureStorage);

  final FlutterSecureStorage secureStorage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  @override
  Future<void> saveTokens(AuthModel model) async {
    await secureStorage.write(key: _accessTokenKey, value: model.accessToken);
    await secureStorage.write(key: _refreshTokenKey, value: model.refreshToken);
  }

  @override
  Future<String?> getAccessToken() => secureStorage.read(key: _accessTokenKey);

  @override
  Future<String?> getRefreshToken() =>
      secureStorage.read(key: _refreshTokenKey);

  @override
  Future<void> deleteTokens() async {
    await secureStorage.delete(key: _accessTokenKey);
    await secureStorage.delete(key: _refreshTokenKey);
  }
}
