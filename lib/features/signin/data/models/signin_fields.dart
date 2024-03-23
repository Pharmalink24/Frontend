import "package:flutter/material.dart";
import "../../../../core/helpers/classes/field.dart";

Map<String, Field> signInFields = {
  "email": Field(
    "Email",
    inputType: TextInputType.emailAddress,
    dbName: "email",
    regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
  ),
  "password": Field(
    "Password",
    inputType: TextInputType.visiblePassword,
    dbName: "password",
    regex: RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$'),
  ),
};