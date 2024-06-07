import 'package:json_annotation/json_annotation.dart';
import 'message.dart';

part 'messages_history_response.g.dart';

@JsonSerializable()
class MessagesHistoryResponse {
  MessagesHistoryResponse({
    required this.messages,
    required this.page,
    required this.pages,
    required this.totalMessages,
  });

  final List<Message> messages;
  final int page;
  final int pages;
  @JsonKey(name: 'total_messages')
  final int totalMessages;

  factory MessagesHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesHistoryResponseToJson(this);
}

extension MessagesHistoryResponseExtension on MessagesHistoryResponse{
  bool isLastPage(int previouslyFetchedItemsCount) {
    return messages.length < previouslyFetchedItemsCount;
  }
}
