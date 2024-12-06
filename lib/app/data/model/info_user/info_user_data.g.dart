// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUserData _$InfoUserDataFromJson(Map<String, dynamic> json) => InfoUserData(
      city: json['city'] as String,
      department: json['department'] as String,
      doc_number: json['doc_number'] as String,
      gender: json['gender'] as String,
      house_number: json['house_number'] as String,
      neighborhood: json['neighborhood'] as String,
      state: json['state'] as bool,
      street_number: json['street_number'] as String,
      type_doc: json['type_doc'] as String,
      type_street: json['type_street'] as String,
    );

Map<String, dynamic> _$InfoUserDataToJson(InfoUserData instance) =>
    <String, dynamic>{
      'city': instance.city,
      'department': instance.department,
      'doc_number': instance.doc_number,
      'gender': instance.gender,
      'house_number': instance.house_number,
      'neighborhood': instance.neighborhood,
      'state': instance.state,
      'street_number': instance.street_number,
      'type_doc': instance.type_doc,
      'type_street': instance.type_street,
    };
