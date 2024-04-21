// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      id: json['id'] as int,
      tradeName: json['TradeName'] as String,
      drugEyeId: json['ID'] as String,
      activeIngredient: json['ScName'] as String,
      quantity: json['HOWMUCH'] as int,
      unit: json['Unit'] as String,
      classification: json['CLASSIFICATION'] as String,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'id': instance.id,
      'TradeName': instance.tradeName,
      'ID': instance.drugEyeId,
      'ScName': instance.activeIngredient,
      'HOWMUCH': instance.quantity,
      'Unit': instance.unit,
      'CLASSIFICATION': instance.classification,
    };
