import 'package:json_annotation/json_annotation.dart';
import 'package:market_place_app/core/types/typedef.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel(this.username, this.password);

  final String username;
  final String password;

  factory LoginModel.fromJson(JSON json) => _$LoginModelFromJson(json);
}
