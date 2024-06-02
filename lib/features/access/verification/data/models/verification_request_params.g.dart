// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationRequestParams _$VerificationRequestParamsFromJson(
        Map<String, dynamic> json) =>
    VerificationRequestParams(
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$VerificationRequestParamsToJson(
        VerificationRequestParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
    };
