import "../../../../../../shared/domain/entities/classes/field.dart";
import "../../../../../../shared/domain/entities/classes/field_item.dart";
import "../../../../../../shared/domain/entities/enums/field_type.dart";

Map<String, Field> editProfileFields = {
  "fname": Field(
    "First Name",
    arabicName: "الاسم الأول",
    inputType: FieldType.text,
    dbName: "fname",
    regex: RegExp(r'^[A-Za-z]+$'),
  ),
  "lname": Field(
    "Last Name",
    arabicName: "الاسم الأخير",
    inputType: FieldType.text,
    dbName: "lname",
    regex: RegExp(r'^[A-Za-z]+$'),
  ),
  "username": Field(
    "Username",
    arabicName: "اسم المستخدم",
    inputType: FieldType.text,
    dbName: "username",
    regex: RegExp(r'^[a-zA-Z0-9_]+$'),
  ),
  "phone": Field(
    "Phone",
    arabicName: "رقم الهاتف",
    inputType: FieldType.phone,
    dbName: "phone",
    regex: RegExp(r'^\+?1?\d{9,15}$'),
  ),
  "birthdate": Field(
    "Birth Date",
    arabicName: "تاريخ الميلاد",
    inputType: FieldType.date,
    dbName: "birthdate",
    regex: RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$'),
  ),
  "gender": Field(
    "Gender",
    arabicName: "الجنس",
    inputType: FieldType.dropdown,
    dbName: "gender",
    items: [
       DropDownFieldItem(key: "M", value: "Male", valueInArabic: "ذكر"),
       DropDownFieldItem(key: "F", value: "Female", valueInArabic: "أنثى"),
    ],
  ),
};
