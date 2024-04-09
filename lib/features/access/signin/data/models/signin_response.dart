// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signin_response.g.dart";

@JsonSerializable()
class SigninResponse {
  int id;
  String username;
  String email;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "access_token")
  String accessToken;

  SigninResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.refreshToken,
    required this.accessToken,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
