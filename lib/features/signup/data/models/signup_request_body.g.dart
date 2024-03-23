// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      birthdate: json['birthdate'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'username': instance.username,
      'password': instance.password,
      'birthdate': instance.birthdate,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'image': instance.image,
    };
