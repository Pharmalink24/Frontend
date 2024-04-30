// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

enum DrugState {
  @JsonValue("new")
  NEW,
  @JsonValue("active")
  ACTIVE,
  @JsonValue("inactive")
  INACTIVE,
}

extension DrugStateExtension on DrugState {
  String get value {
    switch (this) {
      case DrugState.NEW:
        return "new";
      case DrugState.ACTIVE:
        return "active";
      case DrugState.INACTIVE:
        return "inactive";
    }
  }
}
