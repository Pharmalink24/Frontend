import "package:flutter/material.dart";
import "../../classes/field.dart";

List<Field> signInFields = [
  Field("Email", inputType: TextInputType.emailAddress, dbName: "email"),
  Field("Password",
      inputType: TextInputType.visiblePassword, dbName: "password"),
];
