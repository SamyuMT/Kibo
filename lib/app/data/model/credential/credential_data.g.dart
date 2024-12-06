// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialData _$CredentialDataFromJson(Map<String, dynamic> json) =>
    CredentialData(
      cel_number: json['cel_number'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$CredentialDataToJson(CredentialData instance) =>
    <String, dynamic>{
      'cel_number': instance.cel_number,
      'email': instance.email,
      'id': instance.id,
      'state': instance.state,
    };
