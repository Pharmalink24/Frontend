// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageResponse _$HomePageResponseFromJson(Map<String, dynamic> json) =>
    HomePageResponse(
      firstName: json['first_name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      drugs: (json['drugs'] as List<dynamic>)
          .map((e) => Drug.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageResponseToJson(HomePageResponse instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'doctors': instance.doctors,
      'drugs': instance.drugs,
    };
