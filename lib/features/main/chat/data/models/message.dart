import "package:json_annotation/json_annotation.dart";

part "message.g.dart";

@JsonSerializable()
class Message {
  final String id;
  final String message;
  @JsonKey(name: "sender_user_id")
  final String senderUserId;
  @JsonKey(name: "receiver_doctor_id")
  final String receiverDoctorId;
  final String timestamp;

  Message({
    required this.id,
    required this.message,
    required this.senderUserId,
    required this.receiverDoctorId,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}