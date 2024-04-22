import "package:pharmalink/core/helpers/classes/field_type.dart";

import "../../../../../core/helpers/classes/field.dart";

Map<String, Field> signInFields = {
  "email": Field(
    "Email",
    inputType: FieldType.text,
    dbName: "email",
  ),
  "password": Field(
    "Password",
    inputType: FieldType.text,
    dbName: "password",
  ),
};