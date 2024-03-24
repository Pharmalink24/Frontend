import 'package:json_annotation/json_annotation.dart';

part 'verification_request_params.g.dart';

@JsonSerializable()
class VerificationRequestParams {
  @JsonKey(name: 'user_id')
  final int userId;

  VerificationRequestParams({
    required this.userId,
  });

  Map<String, dynamic> toJson() => _$VerificationRequestParamsToJson(this);
}
