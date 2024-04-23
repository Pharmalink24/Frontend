// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'state_request_body.g.dart';

enum State {
  @JsonValue("new")
  NEW,
  @JsonValue("active")
  ACTIVE,
  @JsonValue("inactive")
  INACTIVE,
}

@JsonSerializable()
class StateRequestBody {
  State state;

  StateRequestBody({
    required this.state,
  });

  factory StateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$StateRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$StateRequestBodyToJson(this);
}
