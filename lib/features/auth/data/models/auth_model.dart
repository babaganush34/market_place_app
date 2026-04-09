import 'package:json_annotation/json_annotation.dart';
import 'package:market_place_app/core/types/typedef.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  AuthModel(this.accessToken, this.refreshToken);

  final String accessToken;
  final String refreshToken;

  factory AuthModel.fromJson(JSON json) => _$AuthModelFromJson(json);
}
