import 'package:json_annotation/json_annotation.dart';

enum EatingState {
  @JsonValue("Before meal")
  beforeMeal,
  @JsonValue("After meal")
  afterMeal,
  @JsonValue("None")
  none,
}

extension EatingStateExtension on EatingState {
  String get value {
    switch (this) {
      case EatingState.beforeMeal:
        return "Before";
      case EatingState.afterMeal:
        return "After";
      case EatingState.none:
        return "None";
    }
  }
}

extension EatingStateValueExtension on String {
  EatingState get toEatingState {
    switch (this) {
      case "Before":
        return EatingState.beforeMeal;
      case "After":
        return EatingState.afterMeal;
      case "None":
        return EatingState.none;
      default:
        throw Exception("Invalid eating state");
    }
  }
}
