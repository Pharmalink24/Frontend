// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateRequestBody _$StateRequestBodyFromJson(Map<String, dynamic> json) =>
    StateRequestBody(
      state: $enumDecode(_$StateEnumMap, json['state']),
    );

Map<String, dynamic> _$StateRequestBodyToJson(StateRequestBody instance) =>
    <String, dynamic>{
      'state': _$StateEnumMap[instance.state]!,
    };

const _$StateEnumMap = {
  State.NEW: 'new',
  State.ACTIVE: 'active',
  State.INACTIVE: 'inactive',
};
