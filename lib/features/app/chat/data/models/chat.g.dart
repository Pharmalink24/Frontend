// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      chatWithId: (json['chat_with_id'] as num?)?.toInt(),
      fname: json['chat_with_fname'] as String?,
      lname: json['chat_with_lname'] as String?,
      image: json['chat_with_image'] as String?,
      username: json['chat_with_username'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageDateTime: json['last_message_date_time'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chat_with_id': instance.chatWithId,
      'chat_with_fname': instance.fname,
      'chat_with_lname': instance.lname,
      'chat_with_image': instance.image,
      'chat_with_username': instance.username,
      'last_message': instance.lastMessage,
      'last_message_date_time': instance.lastMessageDateTime,
    };
