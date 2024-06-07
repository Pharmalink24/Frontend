

import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue("M")
  male,
  @JsonValue("F")
  female,
}