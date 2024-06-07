// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwoDrugsInteractionResponse _$TwoDrugsInteractionResponseFromJson(
        Map<String, dynamic> json) =>
    TwoDrugsInteractionResponse(
      messages:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TwoDrugsInteractionResponseToJson(
        TwoDrugsInteractionResponse instance) =>
    <String, dynamic>{
      'message': instance.messages,
    };
