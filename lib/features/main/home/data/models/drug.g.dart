// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      commercialName: json['commercial_name'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      quantity: json['quantity'] as int,
      quantityUnit: json['quantity_unit'] as String,
      rate: (json['rate'] as num).toDouble(),
      rateUnit: json['rate_unit'] as String,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'commercial_name': instance.commercialName,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'quantity': instance.quantity,
      'quantity_unit': instance.quantityUnit,
      'rate': instance.rate,
      'rate_unit': instance.rateUnit,
    };
