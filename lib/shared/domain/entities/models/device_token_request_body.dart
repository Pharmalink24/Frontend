import 'package:json_annotation/json_annotation.dart';

part 'device_token_request_body.g.dart';

@JsonSerializable()
class DeviceTokenRequestBody {
  @JsonKey(name: 'device_token')
  String deviceToken;

  DeviceTokenRequestBody({
    required this.deviceToken,
  });

  factory DeviceTokenRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenRequestBodyToJson(this);
}
