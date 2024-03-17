import "package:flutter/material.dart";

class Input {
  final String name;
  final TextInputType inputType;
  final List<String>? listContents;
  final String? dbName;
  String? value;

  Input(
    this.name, {
    this.dbName,
    this.inputType = TextInputType.none,
    this.listContents,
    this.value,
  });
}
