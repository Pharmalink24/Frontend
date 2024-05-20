// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signin_response.g.dart";

@JsonSerializable()
class SigninResponse {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  const SigninResponse({
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
