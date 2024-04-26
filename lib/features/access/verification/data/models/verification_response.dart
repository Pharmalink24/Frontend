// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "verification_response.g.dart";

@JsonSerializable()
class VerificationResponse {
  final String message;

  VerificationResponse({
    required this.message,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationResponseToJson(this);
}
