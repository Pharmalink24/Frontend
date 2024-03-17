import "package:flutter/material.dart";
import "package:pharmalink/models/input.dart";

List<Input> patientSignUpModel = [
  Input("First Name", inputType: TextInputType.name),
  Input("Last Name", inputType: TextInputType.name),
  Input("Username", inputType: TextInputType.name),
  Input("Password", inputType: TextInputType.visiblePassword),
  Input("Confirm Password", inputType: TextInputType.visiblePassword),
  Input("Email", inputType: TextInputType.emailAddress),
  Input("Phone", inputType: TextInputType.phone),
  Input("Birth Date", inputType: TextInputType.datetime),
];
