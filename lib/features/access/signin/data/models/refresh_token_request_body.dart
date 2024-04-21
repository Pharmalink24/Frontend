import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_body.g.dart';

@JsonSerializable()
class RefreshTokenRequestBody {
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  const RefreshTokenRequestBody({
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => _$RefreshTokenRequestBodyToJson(this);
}
