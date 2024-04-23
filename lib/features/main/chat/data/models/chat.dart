import "package:json_annotation/json_annotation.dart";

part "chat.g.dart";

@JsonSerializable()
class Chat {
  final String id;
  @JsonKey(name: "doctor_id")
  final String doctorId;
  @JsonKey(name: "doctor_name")
  final String doctorName;
  @JsonKey(name: "doctor_image")
  final String doctorImage;
  @JsonKey(name: 'doctor_username')
  final String doctorUsername;
  @JsonKey(name: "last_message")
  final String lastMessage;

  Chat({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorUsername,
    required this.lastMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
