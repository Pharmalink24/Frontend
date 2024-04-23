import "package:pharmalink/core/helpers/classes/field.dart";
import "package:pharmalink/core/helpers/classes/field_type.dart";

Map<String, Field> changePasswordFields = {
  "currentPassword": Field(
    "Current Password",
    inputType: FieldType.password,
    dbName: "old_password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "newPassword": Field(
    "New Password",
    inputType: FieldType.password,
    dbName: "new_password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "confirmPassword": Field(
    "Confirm Password",
    inputType: FieldType.password,
    dbName: null,
    confirmationValue: "newPassword",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
};
