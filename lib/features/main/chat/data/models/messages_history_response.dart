import 'package:json_annotation/json_annotation.dart';
import 'message.dart';

part 'messages_history_response.g.dart';

@JsonSerializable()
class MessagesHistoryResponse {
  MessagesHistoryResponse({
    required this.messages,
  });

  final List<Message> messages;

  factory MessagesHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesHistoryResponseToJson(this);
}
