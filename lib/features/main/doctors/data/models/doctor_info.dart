import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/domain/entities/enums/gender.dart';

part 'doctor_info.g.dart';

// Doctor model
@JsonSerializable()
class DoctorInfo {
  final int id;
  @JsonKey(name: 'fname')
  final String firstName;
  @JsonKey(name: 'lname')
  final String lastName;
  final String? username;
  final String? birthdate;
  final String? email;
  final String? phone;
  final Gender? gender;
  @JsonKey(name: 'license_number')
  final String? licenseNumber;
  @JsonKey(name: 'specialization')
  final String? specialization;
  final String? degree;
  @JsonKey(name: 'graduation_date')
  final String? graduationDate;
  final String? university;
  final String? brief;
  final String? image;

  DoctorInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
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
    this.brief,
    this.image,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) =>
      _$DoctorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorInfoToJson(this);
}
