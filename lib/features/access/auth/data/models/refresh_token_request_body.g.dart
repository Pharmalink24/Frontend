// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRequestBody _$RefreshTokenRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenRequestBody(
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$RefreshTokenRequestBodyToJson(
        RefreshTokenRequestBody instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };
