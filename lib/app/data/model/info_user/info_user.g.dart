// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUser _$InfoUserFromJson(Map<String, dynamic> json) => InfoUser(
      data: InfoUserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$InfoUserToJson(InfoUser instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.toJson(),
    };
