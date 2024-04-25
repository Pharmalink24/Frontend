import "package:json_annotation/json_annotation.dart";

part "chat.g.dart";

@JsonSerializable()
class Chat {
  @JsonKey(name: "doctor_id")
  final int doctorId;
  @JsonKey(name: "doctor_fname")
  final String doctorFname;
  @JsonKey(name: "doctor_lname")
  final String doctorLname;
  @JsonKey(name: "doctor_image")
  final String? doctorImage;
  @JsonKey(name: 'doctor_username')
  final String doctorUsername;
  @JsonKey(name: "last_message")
  final String lastMessage;
  @JsonKey(name: "last_message_date_time")
  final String lastMessageDateTime;

  Chat({
    required this.doctorId,
    required this.doctorFname,
    required this.doctorLname,
    this.doctorImage,
    required this.doctorUsername,
    required this.lastMessage,
    required this.lastMessageDateTime,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
