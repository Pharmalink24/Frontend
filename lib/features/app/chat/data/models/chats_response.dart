import "package:json_annotation/json_annotation.dart";
import "chat.dart";

part "chats_response.g.dart";

@JsonSerializable()
class ChatsResponse {
  @JsonKey(name: 'user_chats')
  final List<Chat> userChats;

  ChatsResponse({
    required this.userChats,
  });

  factory ChatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsResponseToJson(this);
}
