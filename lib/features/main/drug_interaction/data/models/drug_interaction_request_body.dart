import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_request_body.g.dart';

@JsonSerializable()
class DrugInteractionRequestBody {
  @JsonKey(name: 'drug1_name')
  final String activeIngredient1;
  @JsonKey(name: 'drug2_name', includeIfNull: false)
  final String? activeIngredient2;

  DrugInteractionRequestBody({
    required this.activeIngredient1,
    this.activeIngredient2,
  });

  factory DrugInteractionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DrugInteractionRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DrugInteractionRequestBodyToJson(this);
}
