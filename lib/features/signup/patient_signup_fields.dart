import "package:flutter/material.dart";
import "../../core/helpers/classes/field.dart";

List<Field> patientSignUpFields = [
  Field("First Name", inputType: TextInputType.name, dbName: "fname"),
  Field("Last Name", inputType: TextInputType.name, dbName: "lname"),
  Field("Username", inputType: TextInputType.name, dbName: "username"),
  Field("Password",
      inputType: TextInputType.visiblePassword, dbName: "password"),
  Field("Confirm Password",
      inputType: TextInputType.visiblePassword, dbName: null),
  Field("Email", inputType: TextInputType.emailAddress, dbName: "email"),
  Field("Phone", inputType: TextInputType.phone, dbName: "phone"),
  Field("Birth Date", inputType: TextInputType.datetime, dbName: "birthdate"),
  Field("Gender", inputType: TextInputType.datetime, dbName: "gender"),
];
