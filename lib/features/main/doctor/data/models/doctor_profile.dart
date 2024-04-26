import 'package:json_annotation/json_annotation.dart';

part 'doctor_profile.g.dart';

// {
//     "id": 9,
//     "fname": "Ismail",
//     "lname": "Tawfik",
//     "username": "potojj243DDDssdddds",
//     "birthdate": "2002-05-01",
//     "email": "elshefffDDDDlyziad@gmail.com",
//     "phone": "23456765432",
//     "gender": "M",
//     "license_number": "7685847635",
//     "specialization": "general",
//     "degree": "good",
//     "graduation_date": "2024-06-18",
//     "university": "Cairo Univeristy",
//     "brief": null,
//     "image": "/doctor_images/WhatsApp_Image_2023-11-27_at_11.12.12_AM_ZktVrpO.jpeg"
// }

@JsonSerializable()
class DoctorProfile {
  final int id;
  final String fname;
  final String lname;
  final String username;
  final String birthdate;
  final String email;
  final String phone;
  final String gender;
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  final String specialization;
  final String degree;
  @JsonKey(name: 'graduation_date')
  final String graduationDate;
  final String university;
  final String brief;
  final String image;

  DoctorProfile({
    required this.id,
    required this.fname,
    required this.lname,
    required this.username,
    required this.birthdate,
    required this.email,
    required this.phone,
    required this.gender,
    required this.licenseNumber,
    required this.specialization,
    required this.degree,
    required this.graduationDate,
    required this.university,
    required this.brief,
    required this.image,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => _$DoctorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorProfileToJson(this);
}
