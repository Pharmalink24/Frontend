import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_response.g.dart';

@JsonSerializable()
class TwoDrugsInteractionResponse {
  @JsonKey(name: 'message')
  final List<String> messages;

  TwoDrugsInteractionResponse({
    required this.messages,
  });

  factory TwoDrugsInteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$TwoDrugsInteractionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TwoDrugsInteractionResponseToJson(this);
}
