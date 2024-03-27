import "package:flutter/material.dart";

import "../../../../../core/helpers/classes/field.dart";

Map<String, Field> signInFields = {
  "email": Field(
    "Email",
    inputType: TextInputType.emailAddress,
    dbName: "email",
  ),
  "password": Field(
    "Password",
    inputType: TextInputType.visiblePassword,
    dbName: "password",
  ),
};