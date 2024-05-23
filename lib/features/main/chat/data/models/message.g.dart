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
      success: json['success'] as bool? ?? true,
      isDelivered: json['is_delivered'] as bool?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sender_user_id', instance.senderUserId);
  writeNotNull('sender_doctor_id', instance.senderDoctorId);
  writeNotNull('receiver_user_id', instance.receiverUserId);
  writeNotNull('receiver_doctor_id', instance.receiverDoctorId);
  writeNotNull('message', instance.message);
  writeNotNull('image', instance.image);
  writeNotNull('file', instance.file);
  writeNotNull('voice_message', instance.voiceMessage);
  writeNotNull('timestamp', instance.timestamp);
  val['success'] = instance.success;
  writeNotNull('is_delivered', instance.isDelivered);
  return val;
}
