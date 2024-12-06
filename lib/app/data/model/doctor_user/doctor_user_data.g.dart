// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorUserData _$DoctorUserDataFromJson(Map<String, dynamic> json) =>
    DoctorUserData(
      email: json['email'] as String,
      institution: json['institution'] as String,
      last_name: json['last_name'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$DoctorUserDataToJson(DoctorUserData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'institution': instance.institution,
      'last_name': instance.last_name,
      'name': instance.name,
      'specialty': instance.specialty,
      'state': instance.state,
    };
