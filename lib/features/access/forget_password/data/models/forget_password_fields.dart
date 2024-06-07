import "../../../../../shared/domain/entities/classes/field.dart";
import "../../../../../shared/domain/entities/enums/field_type.dart";


Map<String, Field> forgetPasswordFields = {
  "email": Field(
    "Email",
    arabicName: "البريد الإلكتروني",
    inputType: FieldType.text,
    dbName: "email",
  ),
};
