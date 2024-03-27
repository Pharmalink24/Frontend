import 'package:json_annotation/json_annotation.dart';

part 'signin_request_body.g.dart';

@JsonSerializable()
class SigninRequestBody {
  final String email;
  final String password;

  SigninRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SigninRequestBodyToJson(this);
}
