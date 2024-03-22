// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";

enum ValidationType {
  REQUIRED,
  HAS_MINIMUM_LENGTH,
  HAS_LOWER_CASE,
  HAS_UPPER_CASE,
  HAS_SPECIAL_CHARACTER,
  HAS_NUMBER,
  WITHOUT_SPACES,
  EMAIL
}

Map<ValidationType, String> errorMessages = {
  ValidationType.REQUIRED: "Required field, please don't leave it empty !",
  ValidationType.HAS_MINIMUM_LENGTH: "Must be more than 8 letters.",
  ValidationType.HAS_LOWER_CASE: "At least 1 lowercase letter.",
  ValidationType.HAS_UPPER_CASE: "At least 1 uppercase letter.",
  ValidationType.HAS_SPECIAL_CHARACTER: "At least 1 special character.",
  ValidationType.HAS_NUMBER: "At least 1 number.",
  ValidationType.WITHOUT_SPACES: "",
  ValidationType.EMAIL: "Required Field, don't leave it empty",

};

Map<ValidationType, Function> validationFunctions = {};

class Field {
  final String name;
  final TextInputType inputType;
  final List<String>? items;
  final String? dbName;
  String? value;
  TextEditingController? controller;
  List<ValidationType>? validations;

  Field(
    this.name, {
    this.dbName,
    this.inputType = TextInputType.none,
    this.items,
    this.value,
    this.controller,
    this.validations,
  });
}
