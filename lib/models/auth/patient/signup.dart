import "package:flutter/material.dart";
import "package:pharmalink/models/input.dart";

List<Input> patientSignUpModel = [
  Input("First Name", inputType: TextInputType.name, dbName: "fname"),
  Input("Last Name", inputType: TextInputType.name, dbName: "lname"),
  Input("Username", inputType: TextInputType.name,  dbName: "username"),
  Input("Password", inputType: TextInputType.visiblePassword,  dbName: "password"),
  Input("Confirm Password", inputType: TextInputType.visiblePassword, dbName: null),
  Input("Email", inputType: TextInputType.emailAddress, dbName: "email"),
  Input("Phone", inputType: TextInputType.phone, dbName: "phone"),
  Input("Birth Date", inputType: TextInputType.datetime, dbName: "birthdate"),
  Input("Gender", inputType: TextInputType.datetime, dbName: "gender"),
];
