import 'package:json_annotation/json_annotation.dart';
part 'refresh_taken_request_body.g.dart';

@JsonSerializable()
class RefreshTakenRequestBody {
  @JsonKey(name:"refresh_taken")
  final String refreshTaken;

  RefreshTakenRequestBody({
    required this.refreshTaken,
  });

  Map<String, dynamic> toJson() => _$RefreshTakenRequestBodyToJson(this);
}
