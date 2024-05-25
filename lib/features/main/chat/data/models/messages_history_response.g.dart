// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesHistoryResponse _$MessagesHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    MessagesHistoryResponse(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesHistoryResponseToJson(
        MessagesHistoryResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
