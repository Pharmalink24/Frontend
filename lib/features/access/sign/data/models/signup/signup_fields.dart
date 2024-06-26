

import '../../../../../../core/helpers/classes/field.dart';
import '../../../../../../core/helpers/classes/field_item.dart';
import '../../../../../../core/helpers/classes/field_type.dart';

Map<String, Field> signUpFields = {
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
  "password": Field(
    "Password",
    arabicName: "كلمة المرور",
    inputType: FieldType.password,
    dbName: "password",
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ),
  "confirmPassword": Field(
    "Confirm Password",
    arabicName: "تأكيد كلمة المرور",
    inputType: FieldType.password,
    dbName: null,
    regex:
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
    confirmationValue: "password",
  ),
  "email": Field(
    "Email",
    arabicName: "البريد الإلكتروني",
    inputType: FieldType.email,
    dbName: "email",
    regex: RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$'),
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
