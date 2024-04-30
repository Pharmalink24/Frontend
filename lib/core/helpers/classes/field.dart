import "package:flutter/material.dart";
import "package:pharmalink/core/helpers/classes/field_item.dart";

import "field_type.dart";

class Field {
  late String name;
  final FieldType inputType;
  final List<DropDownFieldItem>? items;
  final String? dbName;
  String? value;
  TextEditingController? controller;
  RegExp? regex;
  String? errorMessage;
  TextInputType? textInputType;
  String? confirmationValue;
  String? confirmationErrorMessage;
  String? arabicName;

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
    this.arabicName,
  }) {
    // Set the text input type based on the field type
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
