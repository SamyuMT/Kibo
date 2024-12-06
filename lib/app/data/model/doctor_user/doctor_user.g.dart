// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorUser _$DoctorUserFromJson(Map<String, dynamic> json) => DoctorUser(
      data: DoctorUserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$DoctorUserToJson(DoctorUser instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.toJson(),
    };
