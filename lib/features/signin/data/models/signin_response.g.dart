// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    SigninResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      token: json['token'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      initials: json['initials'] as String,
    );

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'initials': instance.initials,
    };
