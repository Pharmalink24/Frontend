import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final int id;
  final String image;
  final String username;
  final String firstName;
  final String lastName;
  final String specialty;

  Doctor({
    required this.id,
    required this.image,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.specialty,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}