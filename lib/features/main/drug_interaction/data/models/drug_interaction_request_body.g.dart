// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInteractionRequestBody _$DrugInteractionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DrugInteractionRequestBody(
      activeIngredient: json['drug_name'] as String?,
      activeIngredient1: json['drug1_name'] as String?,
      activeIngredient2: json['drug2_name'] as String?,
    );

Map<String, dynamic> _$DrugInteractionRequestBodyToJson(
    DrugInteractionRequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('drug_name', instance.activeIngredient);
  writeNotNull('drug1_name', instance.activeIngredient1);
  writeNotNull('drug2_name', instance.activeIngredient2);
  return val;
}
