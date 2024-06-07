import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_request_body.g.dart';

@JsonSerializable()
class DrugInteractionRequestBody {
  @JsonKey(name: 'drug_name', includeIfNull: false)
  final String? activeIngredient;
  @JsonKey(name: 'drug1_name', includeIfNull: false)
  final String? activeIngredient1;
  @JsonKey(name: 'drug2_name', includeIfNull: false)
  final String? activeIngredient2;

  DrugInteractionRequestBody({
    this.activeIngredient,
    this.activeIngredient1,
    this.activeIngredient2,
  });

  factory DrugInteractionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DrugInteractionRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DrugInteractionRequestBodyToJson(this);
}
