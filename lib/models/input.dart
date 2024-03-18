import "package:flutter/material.dart";

class Input {
  final String name;
  final TextInputType inputType;
  final List<String>? items;
  final String? dbName;
  String? value;

  Input(
    this.name, {
    this.dbName,
    this.inputType = TextInputType.none,
    this.items,
    this.value,
  });
}
