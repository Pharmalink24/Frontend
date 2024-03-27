import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String fname;
  final String lname;
  final String username;
  final String password;
  final String birthdate;
  final String email;
  final String phone;
  final String gender;
  final String? image;

  SignupRequestBody({
    required this.fname,
    required this.lname,
    required this.username,
    required this.password,
    required this.birthdate,
    required this.email,
    required this.phone,
    required this.gender,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
