// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInteractionResponse _$DrugInteractionResponseFromJson(
        Map<String, dynamic> json) =>
    DrugInteractionResponse(
      type: json['Type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DrugInteractionResponseToJson(
        DrugInteractionResponse instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'message': instance.message,
    };
