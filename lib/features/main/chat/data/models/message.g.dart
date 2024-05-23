// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int?,
      senderUserId: json['sender_user_id'] as int?,
      senderDoctorId: json['sender_doctor_id'] as int?,
      receiverUserId: json['receiver_user_id'] as int?,
      receiverDoctorId: json['receiver_doctor_id'] as int?,
      message: json['message'] as String?,
      image: json['image'] as String?,
      file: json['file'] as String?,
      voiceMessage: json['voice_message'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : Timestamp.fromJson(json['timestamp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'sender_user_id': instance.senderUserId,
      'sender_doctor_id': instance.senderDoctorId,
      'receiver_user_id': instance.receiverUserId,
      'receiver_doctor_id': instance.receiverDoctorId,
      'message': instance.message,
      'image': instance.image,
      'file': instance.file,
      'voice_message': instance.voiceMessage,
      'timestamp': instance.timestamp,
    };
