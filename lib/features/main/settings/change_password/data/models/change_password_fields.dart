import "package:pharmalink/core/helpers/classes/field.dart";
import "package:pharmalink/core/helpers/classes/field_type.dart";

Map<String, Field> changePasswordFields = {
  "current_password": Field(
    "Current Password",
    inputType: FieldType.password,
    dbName: "old_password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "new_password": Field(
    "New Password",
    inputType: FieldType.text,
    dbName: "new_password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "confirm_password": Field(
    "Confirm Password",
    inputType: FieldType.password,
    dbName: null,
    confirmationValue: "new_password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
};
