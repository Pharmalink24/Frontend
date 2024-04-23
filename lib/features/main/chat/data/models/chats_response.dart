import "package:json_annotation/json_annotation.dart";
import "chat.dart";

part "chats_response.g.dart";

@JsonSerializable()
class ChatsResponse {
  final List<Chat> chats;

  ChatsResponse({
    required this.chats,
  });

  factory ChatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsResponseToJson(this);
}
