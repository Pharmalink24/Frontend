// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signin_response.g.dart";

@JsonSerializable()
class SigninResponse {
  int id;
  String email;
  String token;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String initials;

  SigninResponse({
    required this.id,
    required this.email,
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.initials,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}
