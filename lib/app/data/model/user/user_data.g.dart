// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      cel_number: json['cel_number'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      rol: json['rol'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'cel_number': instance.cel_number,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'rol': instance.rol,
      'state': instance.state,
    };
