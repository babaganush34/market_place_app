import 'package:market_place_app/features/auth/data/models/auth_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveTokens(AuthModel model);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> deleteTokens();
}
