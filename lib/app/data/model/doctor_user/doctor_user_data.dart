import 'package:json_annotation/json_annotation.dart';
part 'doctor_user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorUserData {
  String email;
  String institution;
  String last_name;
  String name;
  String specialty;
  bool state;

  DoctorUserData({required this.email, required this.institution, required this.last_name,required this.name,
    required this.specialty, required this.state});

  factory DoctorUserData.fromJson(Map<String, dynamic> data) => _$DoctorUserDataFromJson(data);

  Map<String, dynamic> toJson() => _$DoctorUserDataToJson(this);
}
