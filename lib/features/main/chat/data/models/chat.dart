import "package:json_annotation/json_annotation.dart";

part "chat.g.dart";

// "chat_with_id": 2,
// "chat_with_fname": "adam",
// "chat_with_lname": "elsayed",
// "chat_with_image": "/doctor_images/ziad_WGacWUJ.png",
// "chat_with_username": "domattf",
// "last_message": "xxxxxxxx",
// "last_message_date_time": "2024-05-23 11:12:21"

@JsonSerializable()
class Chat {
  @JsonKey(name: 'chat_with_id')
  int? chatWithId;
  @JsonKey(name: 'chat_with_fname')
  String? fname;
  @JsonKey(name: 'chat_with_lname')
  String? lname;
  @JsonKey(name: 'chat_with_image')
  String? image;
  @JsonKey(name: 'chat_with_username')
  String? username;
  @JsonKey(name: 'last_message')
  String? lastMessage;
  @JsonKey(name: 'last_message_date_time')
  String? lastMessageDateTime;

  Chat({
    required this.chatWithId,
    required this.fname,
    required this.lname,
    required this.image,
    required this.username,
    required this.lastMessage,
    required this.lastMessageDateTime,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
