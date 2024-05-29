import "package:json_annotation/json_annotation.dart";
part "message.g.dart";

@JsonSerializable()
class Message {
  @JsonKey(includeIfNull: false)
  final int? id;
  @JsonKey(name: "sender_user_id", includeIfNull: false)
  final int? senderUserId;
  @JsonKey(name: "sender_doctor_id", includeIfNull: false)
  final int? senderDoctorId;
  @JsonKey(name: "receiver_user_id", includeIfNull: false)
  final int? receiverUserId;
  @JsonKey(name: "receiver_doctor_id", includeIfNull: false)
  final int? receiverDoctorId;
  @JsonKey(includeIfNull: false)
  final String? message;
  @JsonKey(includeIfNull: false)
  final String? timestamp;
  @JsonKey(name: "image", includeIfNull: false)
  final String? image;
  @JsonKey(name: "file", includeIfNull: false)
  final String? file;
  @JsonKey(name: "voice_message", includeIfNull: false)
  final String? voiceMessage;
  @JsonKey(name: 'is_read', includeIfNull: false)
  final bool? isRead;
  @JsonKey(name: "is_delivered", includeIfNull: false)
  final bool? isDelivered;

  Message({
    this.id,
    this.senderUserId,
    this.senderDoctorId,
    this.receiverUserId,
    this.receiverDoctorId,
    this.message,
    this.image,
    this.file,
    this.voiceMessage,
    this.timestamp,
    this.isRead,
    this.isDelivered,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
