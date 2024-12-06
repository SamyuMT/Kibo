import 'package:json_annotation/json_annotation.dart';
import 'emergency_user_data.dart';
part 'emergency_user.g.dart';

@JsonSerializable(explicitToJson: true)
class EmergencyUser {
  String message;
  bool status;
  EmergencyUserData data;

  EmergencyUser({
    required this.data,
    required this.message,
    required this.status,
  });

  factory EmergencyUser.fromJson(Map<String, dynamic> data) =>
      _$EmergencyUserFromJson(data);

  Map<String, dynamic> toJson() => _$EmergencyUserToJson(this);
}
