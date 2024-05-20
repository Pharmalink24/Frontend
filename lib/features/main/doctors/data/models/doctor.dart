import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

// Doctor model
@JsonSerializable()
class Doctor {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String username;
  final String specialty;
  final String? image;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.specialty,
    this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
