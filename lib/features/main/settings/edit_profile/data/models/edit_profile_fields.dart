import "package:pharmalink/core/helpers/classes/field.dart";
import "package:pharmalink/core/helpers/classes/field_type.dart";

Map<String, Field> editProfileFields = {
  "fname": Field(
    "First Name",
    inputType: FieldType.text,
    dbName: "fname",
    regex: RegExp(r'^[A-Za-z]+$'),
  ),
  "lname": Field(
    "Last Name",
    inputType: FieldType.text,
    dbName: "lname",
    regex: RegExp(r'^[A-Za-z]+$'),
  ),
  "username": Field(
    "Username",
    inputType: FieldType.text,
    dbName: "username",
    regex: RegExp(r'^[a-zA-Z0-9_]+$'),
  ),
  "phone": Field(
    "Phone",
    inputType: FieldType.phone,
    dbName: "phone",
    regex: RegExp(r'^\+?1?\d{9,15}$'),
  ),
  "birthdate": Field(
    "Birth Date",
    inputType: FieldType.date,
    dbName: "birthdate",
    regex: RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$'),
  ),
  "gender": Field(
    "Gender",
    inputType: FieldType.dropdown,
    dbName: "gender",
    items: {
       "M": "Male",
       "F": "Female",
    },
  ),
};
