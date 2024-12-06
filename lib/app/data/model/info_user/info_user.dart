import 'package:json_annotation/json_annotation.dart';
import 'info_user_data.dart';
part 'info_user.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoUser {
  String message;
  bool status;
  InfoUserData data;

  InfoUser({
    required this.data,
    required this.message,
    required this.status,
  });

  factory InfoUser.fromJson(Map<String, dynamic> data) =>
      _$InfoUserFromJson(data);

  Map<String, dynamic> toJson() => _$InfoUserToJson(this);
}
