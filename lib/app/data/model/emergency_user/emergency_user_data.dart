import 'package:json_annotation/json_annotation.dart';
part 'emergency_user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class EmergencyUserData {
  String cel_mobile;
  String city;
  String department;
  String doc_number;
  String gender;
  String house_number;
  String last_name;
  String name;
  String neighborhood;
  String relationship;
  bool state;
  String street_number;
  String type_doc;
  String type_street;

  EmergencyUserData({required this.cel_mobile, required this.city, required this.department,required this.doc_number,
    required this.gender, required this.house_number, required this.last_name, required this.name,
    required this.neighborhood, required this.relationship, required this.state,required this.street_number,
    required this.type_doc, required this.type_street});

  factory EmergencyUserData.fromJson(Map<String, dynamic> data) => _$EmergencyUserDataFromJson(data);

  Map<String, dynamic> toJson() => _$EmergencyUserDataToJson(this);
}
