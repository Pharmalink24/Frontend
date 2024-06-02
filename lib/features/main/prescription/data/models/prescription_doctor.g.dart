// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionDoctor _$PrescriptionDoctorFromJson(Map<String, dynamic> json) =>
    PrescriptionDoctor(
      id: (json['id'] as num).toInt(),
      doctorInfo:
          DoctorInfo.fromJson(json['doctorInfo'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$PrescriptionDoctorToJson(PrescriptionDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorInfo': instance.doctorInfo,
      'created_at': instance.createdAt,
    };
