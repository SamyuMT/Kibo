// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyUserData _$EmergencyUserDataFromJson(Map<String, dynamic> json) =>
    EmergencyUserData(
      cel_mobile: json['cel_mobile'] as String,
      city: json['city'] as String,
      department: json['department'] as String,
      doc_number: json['doc_number'] as String,
      gender: json['gender'] as String,
      house_number: json['house_number'] as String,
      last_name: json['last_name'] as String,
      name: json['name'] as String,
      neighborhood: json['neighborhood'] as String,
      relationship: json['relationship'] as String,
      state: json['state'] as bool,
      street_number: json['street_number'] as String,
      type_doc: json['type_doc'] as String,
      type_street: json['type_street'] as String,
    );

Map<String, dynamic> _$EmergencyUserDataToJson(EmergencyUserData instance) =>
    <String, dynamic>{
      'cel_mobile': instance.cel_mobile,
      'city': instance.city,
      'department': instance.department,
      'doc_number': instance.doc_number,
      'gender': instance.gender,
      'house_number': instance.house_number,
      'last_name': instance.last_name,
      'name': instance.name,
      'neighborhood': instance.neighborhood,
      'relationship': instance.relationship,
      'state': instance.state,
      'street_number': instance.street_number,
      'type_doc': instance.type_doc,
      'type_street': instance.type_street,
    };
