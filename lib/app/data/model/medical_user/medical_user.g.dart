// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalUser _$MedicalUserFromJson(Map<String, dynamic> json) => MedicalUser(
      data: MedicalUserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$MedicalUserToJson(MedicalUser instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.toJson(),
    };
