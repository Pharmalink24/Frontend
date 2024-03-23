import "package:flutter/material.dart";
import "../../../core/helpers/classes/field.dart";

Map<String, Field> patientSignUpFields = {
  "fname": Field(
    "First Name",
    inputType: TextInputType.name,
    dbName: "fname",
    regex: RegExp(r"^[a-z]{1,10}$"),
  ),
  "lname": Field(
    "Last Name",
    inputType: TextInputType.name,
    dbName: "lname",
    regex: RegExp(r"^[a-z']{2,10}$"),
  ),
  "username": Field(
    "Username",
    inputType: TextInputType.name,
    dbName: "username",
    regex: RegExp(r"^[a-z0-9_-]{3,15}$"),
  ),
  "password": Field(
    "Password",
    inputType: TextInputType.visiblePassword,
    dbName: "password",
    regex: RegExp(
        r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$"),
  ),
  "confirmPassword": Field(
    "Confirm Password",
    inputType: TextInputType.visiblePassword,
    dbName: null,
    regex: RegExp(
        r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$'),
  ),
  "email": Field(
    "Email",
    inputType: TextInputType.emailAddress,
    dbName: "email",
    regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
  ),
  "phone": Field(
    "Phone",
    inputType: TextInputType.phone,
    dbName: "phone",
    regex: RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$"),
  ),
  "birthdate": Field(
    "Birth Date",
    inputType: TextInputType.datetime,
    dbName: "birthdate",
    regex: RegExp(r"^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$"),
  ),
  "gender": Field(
    "Gender",
    inputType: TextInputType.text,
    dbName: "gender",
  ),
};
