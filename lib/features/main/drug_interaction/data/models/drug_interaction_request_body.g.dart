// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInteractionRequestBody _$DrugInteractionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DrugInteractionRequestBody(
      activeIngredient1: json['drug1_name'] as String,
      activeIngredient2: json['drug2_name'] as String?,
    );

Map<String, dynamic> _$DrugInteractionRequestBodyToJson(
    DrugInteractionRequestBody instance) {
  final val = <String, dynamic>{
    'drug1_name': instance.activeIngredient1,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('drug2_name', instance.activeIngredient2);
  return val;
}
