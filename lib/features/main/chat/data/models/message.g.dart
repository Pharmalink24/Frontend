// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      message: json['message'] as String,
      senderUserId: json['sender_user_id'] as String,
      receiverDoctorId: json['receiver_doctor_id'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender_user_id': instance.senderUserId,
      'receiver_doctor_id': instance.receiverDoctorId,
      'timestamp': instance.timestamp,
    };
