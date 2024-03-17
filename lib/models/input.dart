import "package:flutter/material.dart";

class Input {
  final String name;
  final TextInputType inputType;
  final List<String>? listContents;
  String? value;

  Input(
    this.name, {
    this.inputType = TextInputType.none,
    this.listContents,
    this.value,
  });
}
