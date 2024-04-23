// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      doctorName: json['doctor_name'] as String,
      doctorImage: json['doctor_image'] as String,
      doctorUsername: json['doctor_username'] as String,
      lastMessage: json['last_message'] as String,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'doctor_image': instance.doctorImage,
      'doctor_username': instance.doctorUsername,
      'last_message': instance.lastMessage,
    };
