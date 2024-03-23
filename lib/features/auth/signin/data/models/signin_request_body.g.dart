// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRequestBody _$SigninRequestBodyFromJson(Map<String, dynamic> json) =>
    SigninRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestBodyToJson(SigninRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
