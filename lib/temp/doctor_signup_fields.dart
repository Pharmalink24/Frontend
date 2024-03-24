import "package:flutter/material.dart";
import "../core/helpers/classes/field.dart";

const List<String> doctorSpecialtyList = [
  "Accident and emergency medicine",
  "Allergology",
  "Anaesthetics",
  "Biological hematology",
  "Cardiology",
  "Child psychiatry",
  "Clinical biology",
  "Clinical chemistry",
  "Clinical neurophysiology",
  "Clinical radiology",
  "Dental, oral and maxillo-facial surgery",
  "Dermato-venerology",
  "Dermatology",
  "Endocrinology",
  "Gastro-enterologic surgery",
  "Gastroenterology",
  "General hematology",
  "General Practice",
  "General surgery",
  "Geriatrics",
  "Immunology",
  "Infectious diseases",
  "Internal medicine",
  "Laboratory medicine",
  "Maxillo-facial surgery",
  "Microbiology",
  "Nephrology",
  "Neuro-psychiatry",
  "Neurology",
  "Neurosurgery",
  "Nuclear medicine",
  "Obstetrics and gynecology",
  "Occupational medicine",
  "Ophthalmology",
  "Orthopaedics",
  "Otorhinolaryngology",
  "Paediatric surgery",
  "Paediatrics",
  "Pathology",
  "Pharmacology",
  "Physical medicine and rehabilitation",
  "Plastic surgery",
  "Podiatric Medicine",
  "Podiatric Surgery",
  "Psychiatry",
  "Public health and Preventive Medicine",
  "Radiology",
  "Radiotherapy",
  "Respiratory medicine",
  "Rheumatology",
  "Stomatology",
  "Thoracic surgery",
  "Tropical medicine",
  "Urology",
  "Vascular surgery",
  "Venereology",
];
const List<String> doctorDegreeList = [
  "Master's degree",
  "Doctorate",
  "Higher doctorate",
  "Magister degree",
];

List<Field> doctorSignUpFields = [
  Field("First Name", inputType: TextInputType.name, dbName: "fname"),
  Field("Last Name", inputType: TextInputType.name, dbName: "lname"),
  Field("Username", inputType: TextInputType.name, dbName: "username"),
  Field("Password",
      inputType: TextInputType.visiblePassword, dbName: "password"),
  Field("Confirm Password",
      inputType: TextInputType.visiblePassword, dbName: null),
  Field("Email", inputType: TextInputType.emailAddress, dbName: "email"),
  Field("Phone", inputType: TextInputType.phone, dbName: "phone"),
  Field("License Number",
      inputType: TextInputType.name, dbName: "license_number"),
  Field("Degree",
      inputType: TextInputType.none, items: doctorDegreeList, dbName: "degree"),
  Field("Specialty",
      inputType: TextInputType.none,
      items: doctorSpecialtyList,
      dbName: "specialization"),
  Field("Graduation Date",
      inputType: TextInputType.datetime, dbName: "graduation_date"),
  Field("University", inputType: TextInputType.name, dbName: "university"),
  Field("Birth Date", inputType: TextInputType.datetime, dbName: "birthdate"),
  Field("Gender", inputType: TextInputType.name, dbName: "gender"),
];