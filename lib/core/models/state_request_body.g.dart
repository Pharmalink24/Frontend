// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateRequestBody _$StateRequestBodyFromJson(Map<String, dynamic> json) =>
    StateRequestBody(
      state: $enumDecode(_$DrugStateEnumMap, json['state']),
    );

Map<String, dynamic> _$StateRequestBodyToJson(StateRequestBody instance) =>
    <String, dynamic>{
      'state': _$DrugStateEnumMap[instance.state]!,
    };

const _$DrugStateEnumMap = {
  DrugState.NEW: 'new',
  DrugState.ACTIVE: 'active',
  DrugState.INACTIVE: 'inactive',
};
