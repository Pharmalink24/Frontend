import "package:flutter/material.dart";

import "field_type.dart";

class Field {
  final String name;
  final FieldType inputType;
  final Map<String, String>? items;
  final String? dbName;
  String? value;
  TextEditingController? controller;
  RegExp? regex;
  String? errorMessage;
  TextInputType? textInputType;
  String? confirmationValue;
  String? confirmationErrorMessage;

  Field(
    this.name, {
    this.dbName,
    this.inputType = FieldType.text,
    this.items,
    this.value,
    this.controller,
    this.regex,
    this.errorMessage,
    this.confirmationValue,
    this.confirmationErrorMessage,
  }) {
    switch (inputType) {
      case FieldType.text:
        textInputType = TextInputType.text;
        break;
      case FieldType.password:
        textInputType = TextInputType.visiblePassword;
        break;
      case FieldType.email:
        textInputType = TextInputType.emailAddress;
        break;
      case FieldType.phone:
        textInputType = TextInputType.phone;
        break;
      case FieldType.date:
        textInputType = TextInputType.datetime;
        break;
      case FieldType.time:
        textInputType = TextInputType.datetime;
        break;
      case FieldType.datetime:
        textInputType = TextInputType.datetime;
        break;
      case FieldType.dropdown:
        textInputType = TextInputType.text;
        break;
    }
  }

}
