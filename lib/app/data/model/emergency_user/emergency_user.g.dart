// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyUser _$EmergencyUserFromJson(Map<String, dynamic> json) =>
    EmergencyUser(
      data: EmergencyUserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$EmergencyUserToJson(EmergencyUser instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.toJson(),
    };
