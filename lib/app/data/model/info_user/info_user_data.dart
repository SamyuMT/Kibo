import 'package:json_annotation/json_annotation.dart';
part 'info_user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoUserData {
  String city;
  String department;
  String doc_number;
  String gender;
  String house_number;
  String neighborhood;
  bool state;
  String street_number;
  String type_doc;
  String type_street;

  InfoUserData({required this.city, required this.department,required this.doc_number,
    required this.gender, required this.house_number, required this.neighborhood,
    required this.state, required this.street_number,required this.type_doc, required this.type_street});

  factory InfoUserData.fromJson(Map<String, dynamic> data) => _$InfoUserDataFromJson(data);

  Map<String, dynamic> toJson() => _$InfoUserDataToJson(this);
}
