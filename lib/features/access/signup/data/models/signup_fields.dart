import "package:flutter/material.dart";
import "../../../../../core/helpers/classes/field.dart";

Map<String, Field> signUpFields = {
  "fname": Field(
    "First Name",
    inputType: TextInputType.name,
    dbName: "fname",
  ),
  "lname": Field(
    "Last Name",
    inputType: TextInputType.name,
    dbName: "lname",
  ),
  "username": Field(
    "Username",
    inputType: TextInputType.name,
    dbName: "username",
    regex:
        RegExp(r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$'),
  ),
  "password": Field(
    "Password",
    inputType: TextInputType.visiblePassword,
    dbName: "password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "confirmPassword": Field(
    "Confirm Password",
    inputType: TextInputType.visiblePassword,
    dbName: null,
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
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
    regex: RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$'),
  ),
  "gender": Field(
    "Gender",
    inputType: TextInputType.text,
    dbName: "gender",
  ),
};
