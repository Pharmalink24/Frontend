// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signin_response.g.dart";

@JsonSerializable()
class SigninResponse {
  int id;
  String username;
  String email;
  String token;

  SigninResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}
