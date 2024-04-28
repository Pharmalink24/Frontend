import "package:json_annotation/json_annotation.dart";
import "package:pharmalink/core/models/timestamp.dart";

part "message.g.dart";

// {
//   "_id": {
//     "$oid": "66291c038bde771cd04303b3"
//   },
//   "id": 55,
//   "sender_user_id": 1,
//   "sender_doctor_id": null,
//   "receiver_user_id": null,
//   "receiver_doctor_id": 7,
//   "message": "ezayk ya abdallah",
//   "image": "",
//   "file": "",
//   "voice_message": "",
//   "timestamp": {
//     "$date": "2024-04-24T16:49:39.753Z"
//   }
// }

@JsonSerializable()
class Message {
  final int? id;
  @JsonKey(name: "sender_user_id")
  final int? senderUserId;
  @JsonKey(name: "sender_doctor_id")
  final int? senderDoctorId;
  @JsonKey(name: "receiver_user_id")
  final int? receiverUserId;
  @JsonKey(name: "receiver_doctor_id")
  final int? receiverDoctorId;
  final String? message;
  final String? image;
  final String? file;
  @JsonKey(name: "voice_message")
  final String? voiceMessage;
  final Timestamp? timestamp;
  final bool success;

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
    this.success = true,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
