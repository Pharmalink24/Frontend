// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['id'] as int,
      image: json['image'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      specialty: json['specialty'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'specialty': instance.specialty,
    };
