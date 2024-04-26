// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageRequestBody _$HomePageRequestBodyFromJson(Map<String, dynamic> json) =>
    HomePageRequestBody(
      state: $enumDecode(_$StateEnumMap, json['state']),
    );

Map<String, dynamic> _$HomePageRequestBodyToJson(
        HomePageRequestBody instance) =>
    <String, dynamic>{
      'state': _$StateEnumMap[instance.state]!,
    };

const _$StateEnumMap = {
  State.NEW: 'new',
  State.ACTIVE: 'active',
  State.INACTIVE: 'inactive',
};
