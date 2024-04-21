// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'home_page_request_body.g.dart';

enum State { 
  @JsonValue("new")
  NEW,
  @JsonValue("active")
  ACTIVE,
  @JsonValue("inactive")
  INACTIVE,
}

@JsonSerializable()
class HomePageRequestBody {
  State state;

  HomePageRequestBody({
    required this.state,
  });

  factory HomePageRequestBody.fromJson(Map<String, dynamic> json) =>
      _$HomePageRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageRequestBodyToJson(this);

}

