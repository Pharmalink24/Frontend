// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    SigninResponse(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      accessToken: json['token'] as String,
    );

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'token': instance.accessToken,
    };
