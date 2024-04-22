import 'package:json_annotation/json_annotation.dart';

part 'verification_request_params.g.dart';

@JsonSerializable()
class VerificationRequestParams {
  @JsonKey(name: 'user_id')
  final int userId;

  VerificationRequestParams({
    required this.userId,
  });

  factory VerificationRequestParams.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationRequestParamsToJson(this);
}
