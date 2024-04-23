// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      username: json['username'] as String?,
      birthdate: json['birthdate'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      chronicDisease: (json['chronic_disease'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'username': instance.username,
      'birthdate': instance.birthdate,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'chronic_disease': instance.chronicDisease,
      'image': instance.image,
    };
