// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "signup_response.g.dart";

@JsonSerializable()
class SignupResponse {
  final int id;
  final String fname;
  final String lname;
  final String username;
  final String birthdate;
  final String email;
  final String phone;
  final String gender;
  @JsonKey(name: "chronic_disease")
  final List<String> chronicDisease;
  final String? image;

  SignupResponse({
    required this.id,
    required this.fname,
    required this.lname,
    required this.username,
    required this.birthdate,
    required this.email,
    required this.phone,
    required this.gender,
    required this.chronicDisease,
    required this.image,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
