import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/features/auth/data/models/auth_model.dart';
import 'package:market_place_app/features/auth/data/models/login_model.dart';

@Injectable()
class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<AuthModel> getTokens(LoginModel model) async {
    final response = await _dio.post(
      'https://dummyjson.com/auth/login',
      data: {'username': model.username, 'password': model.password},
    );
    final data = AuthModel.fromJson(response.data);
    return data;
  }
}
