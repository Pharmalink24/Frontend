import "package:json_annotation/json_annotation.dart";

part "message.g.dart";

@JsonSerializable()
class Message {
  final int id;
  final String message;
  @JsonKey(name: "sender_user_id")
  final int senderId;
  @JsonKey(name: "receiver_doctor_id")
  final int receiverId;
  final String timestamp;

  Message({
    required this.id,
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}