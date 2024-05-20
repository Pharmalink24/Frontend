// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) => DoctorInfo(
      id: json['id'] as int,
      firstName: json['fname'] as String,
      lastName: json['lname'] as String,
      username: json['username'] as String?,
      birthdate: json['birthdate'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      licenseNumber: json['license_number'] as String?,
      specialization: json['specialization'] as String?,
      degree: json['degree'] as String?,
      graduationDate: json['graduation_date'] as String?,
      university: json['university'] as String?,
      brief: json['brief'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DoctorInfoToJson(DoctorInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fname': instance.firstName,
      'lname': instance.lastName,
      'username': instance.username,
      'birthdate': instance.birthdate,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender],
      'license_number': instance.licenseNumber,
      'specialization': instance.specialization,
      'degree': instance.degree,
      'graduation_date': instance.graduationDate,
      'university': instance.university,
      'brief': instance.brief,
      'image': instance.image,
    };

const _$GenderEnumMap = {
  Gender.male: 'M',
  Gender.female: 'F',
};
