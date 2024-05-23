import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  final String message;

  MessageResponse({
    required this.message,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
