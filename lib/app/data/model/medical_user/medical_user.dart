import 'package:json_annotation/json_annotation.dart';
import 'medical_user_data.dart';
part 'medical_user.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicalUser {
  String message;
  bool status;
  MedicalUserData data;

  MedicalUser({
    required this.data,
    required this.message,
    required this.status,
  });

  factory MedicalUser.fromJson(Map<String, dynamic> data) =>
      _$MedicalUserFromJson(data);

  Map<String, dynamic> toJson() => _$MedicalUserToJson(this);
}
