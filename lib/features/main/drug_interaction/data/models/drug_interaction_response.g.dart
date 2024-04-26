// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInteractionResponse _$DrugInteractionResponseFromJson(
        Map<String, dynamic> json) =>
    DrugInteractionResponse(
      messages:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DrugInteractionResponseToJson(
        DrugInteractionResponse instance) =>
    <String, dynamic>{
      'message': instance.messages,
    };
