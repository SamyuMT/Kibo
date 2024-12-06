// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalUserData _$MedicalUserDataFromJson(Map<String, dynamic> json) =>
    MedicalUserData(
      id_doctor: json['id_doctor'] as String,
      insurance: json['insurance'] as String,
      state: json['state'] as bool,
      type_link: json['type_link'] as String,
    );

Map<String, dynamic> _$MedicalUserDataToJson(MedicalUserData instance) =>
    <String, dynamic>{
      'id_doctor': instance.id_doctor,
      'insurance': instance.insurance,
      'state': instance.state,
      'type_link': instance.type_link,
    };
