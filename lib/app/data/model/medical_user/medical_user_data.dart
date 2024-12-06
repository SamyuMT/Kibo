import 'package:json_annotation/json_annotation.dart';
part 'medical_user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicalUserData {

  String id_doctor;
  String insurance;
  bool state;
  String type_link;


  MedicalUserData({required this.id_doctor, required this.insurance, required this.state,required this.type_link});

  factory MedicalUserData.fromJson(Map<String, dynamic> data) => _$MedicalUserDataFromJson(data);

  Map<String, dynamic> toJson() => _$MedicalUserDataToJson(this);
}
