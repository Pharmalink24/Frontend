import "package:flutter/material.dart";
import "package:pharmalink/models/input.dart";

List<Input> signInModel = [
  Input("Email", inputType: TextInputType.emailAddress, dbName: "email"),
  Input("Password",
      inputType: TextInputType.visiblePassword, dbName: "password"),
];
