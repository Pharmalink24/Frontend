import "../../../../../core/helpers/classes/field_type.dart";

import "../../../../../core/helpers/classes/field.dart";

Map<String, Field> signInFields = {
  "email": Field(
    "Email",
    arabicName: "البريد الإلكتروني",
    inputType: FieldType.text,
    dbName: "email",
  ),
  "password": Field(
    "Password",
    arabicName: "كلمة المرور",
    inputType: FieldType.password,
    dbName: "password",
  ),
};
