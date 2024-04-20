// {
//         "id": 3,
//         "image": "/doctor_images/WhatsApp_Image_2023-11-27_at_11.12.12_AM_2CMf67z.jpeg",
//         "username": "ismeee"
//       }

import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final int id;
  final String image;
  final String username;

  Doctor({
    required this.id,
    required this.image,
    required this.username,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}