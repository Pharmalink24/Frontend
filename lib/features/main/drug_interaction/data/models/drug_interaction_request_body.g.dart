// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_interaction_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInteractionRequestBody _$DrugInteractionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DrugInteractionRequestBody(
      tradename1: json['trade_name1'] as String,
      tradename2: json['trade_name2'] as String,
    );

Map<String, dynamic> _$DrugInteractionRequestBodyToJson(
        DrugInteractionRequestBody instance) =>
    <String, dynamic>{
      'trade_name1': instance.tradename1,
      'trade_name2': instance.tradename2,
    };
