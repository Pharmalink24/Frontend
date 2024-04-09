import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_response.g.dart';

@JsonSerializable()
class DrugInteractionResponse {
  @JsonKey(name: 'Type')
  final String type;
  @JsonKey(name: 'message')
  final String message;

  DrugInteractionResponse({
    required this.type,
    required this.message,
  });

  factory DrugInteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$DrugInteractionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DrugInteractionResponseToJson(this);}
