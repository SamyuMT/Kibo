// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      img_url: json['img_url'] as String,
      last_name: json['last_name'] as String,
      name: json['name'] as String,
      nick_name: json['nick_name'] as String,
      rol: json['rol'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'img_url': instance.img_url,
      'last_name': instance.last_name,
      'name': instance.name,
      'nick_name': instance.nick_name,
      'rol': instance.rol,
      'state': instance.state,
    };
