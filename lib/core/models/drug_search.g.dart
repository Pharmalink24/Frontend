// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugSearch _$DrugSearchFromJson(Map<String, dynamic> json) => DrugSearch(
      id: (json['id'] as num).toInt(),
      tradeName: json['TradeName'] as String,
      drugEyeId: json['ID'] as String,
      activeIngredient: json['ScName'] as String,
      quantity: (json['HOWMUCH'] as num).toInt(),
      unit: json['Unit'] as String,
      classification: json['CLASSIFICATION'] as String,
    );

Map<String, dynamic> _$DrugSearchToJson(DrugSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'TradeName': instance.tradeName,
      'ID': instance.drugEyeId,
      'ScName': instance.activeIngredient,
      'HOWMUCH': instance.quantity,
      'Unit': instance.unit,
      'CLASSIFICATION': instance.classification,
    };
