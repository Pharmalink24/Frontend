import "package:json_annotation/json_annotation.dart";

part "timestamp.g.dart";


//   "timestamp": {
//     "$date": "2024-04-24T16:49:39.753Z"
//  }
@JsonSerializable()
class Timestamp {
  @JsonKey(name: "\$date")
  final String date;

  Timestamp({
    required this.date,
  });

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);
  Map<String, dynamic> toJson() => _$TimestampToJson(this);
}
