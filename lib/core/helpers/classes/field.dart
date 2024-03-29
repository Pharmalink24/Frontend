import "package:flutter/material.dart";

class Field {
  final String name;
  final TextInputType inputType;
  final List<String>? items;
  final String? dbName;
  String? value;
  TextEditingController? controller;
  RegExp? regex;
  String? errorMessage;

  Field(
    this.name, {
    this.dbName,
    this.inputType = TextInputType.none,
    this.items,
    this.value,
    this.controller,
    this.regex,
    this.errorMessage,
  });
}
