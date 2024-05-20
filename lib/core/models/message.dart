import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String message;

  Message({
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
