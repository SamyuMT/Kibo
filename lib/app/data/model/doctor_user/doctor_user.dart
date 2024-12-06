import 'package:json_annotation/json_annotation.dart';
import 'doctor_user_data.dart';
part 'doctor_user.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorUser {
  String message;
  bool status;
  DoctorUserData data;

  DoctorUser({
    required this.data,
    required this.message,
    required this.status,
  });

  factory DoctorUser.fromJson(Map<String, dynamic> data) =>
      _$DoctorUserFromJson(data);

  Map<String, dynamic> toJson() => _$DoctorUserToJson(this);
}
