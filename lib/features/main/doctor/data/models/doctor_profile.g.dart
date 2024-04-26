// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfile _$DoctorProfileFromJson(Map<String, dynamic> json) =>
    DoctorProfile(
      id: json['id'] as int,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      username: json['username'] as String,
      birthdate: json['birthdate'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      licenseNumber: json['license_number'] as String,
      specialization: json['specialization'] as String,
      degree: json['degree'] as String,
      graduationDate: json['graduation_date'] as String,
      university: json['university'] as String,
      brief: json['brief'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$DoctorProfileToJson(DoctorProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'username': instance.username,
      'birthdate': instance.birthdate,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'license_number': instance.licenseNumber,
      'specialization': instance.specialization,
      'degree': instance.degree,
      'graduation_date': instance.graduationDate,
      'university': instance.university,
      'brief': instance.brief,
      'image': instance.image,
    };
