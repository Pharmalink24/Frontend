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
      page: json['page'] as int,
      pages: json['pages'] as int,
      totalMessages: json['total_messages'] as int,
    );

Map<String, dynamic> _$MessagesHistoryResponseToJson(
        MessagesHistoryResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'page': instance.page,
      'pages': instance.pages,
      'total_messages': instance.totalMessages,
    };
