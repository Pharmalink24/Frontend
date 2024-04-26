// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signup_response.g.dart";

@JsonSerializable()
class SignupResponse {
  final int id;
  final String email;
  final String username;

  SignupResponse({
    required this.id,
    required this.username,
    required this.email,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
