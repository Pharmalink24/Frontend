// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int,
      message: json['message'] as String,
      senderId: json['sender_user_id'] as int,
      receiverId: json['receiver_doctor_id'] as int,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender_user_id': instance.senderId,
      'receiver_doctor_id': instance.receiverId,
      'timestamp': instance.timestamp,
    };
