import 'package:json_annotation/json_annotation.dart';

part 'refresh_taken_response.g.dart';

@JsonSerializable()
class RefreshTakenResponse {
  @JsonKey(name: "access_taken")
  final String accessTaken;

  RefreshTakenResponse({
    required this.accessTaken,
  });

  factory RefreshTakenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTakenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTakenResponseToJson(this);
}
