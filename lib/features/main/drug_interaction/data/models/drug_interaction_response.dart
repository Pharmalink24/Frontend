import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_response.g.dart';

@JsonSerializable()
class DrugInteractionResponse {
  @JsonKey(name: 'message')
  final List<String> messages;

  DrugInteractionResponse({
    required this.messages,
  });

  factory DrugInteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$DrugInteractionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DrugInteractionResponseToJson(this);
}
