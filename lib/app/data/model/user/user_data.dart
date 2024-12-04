import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  String cel_number;
  String email;
  String id;
  String name;
  String rol;
  bool state;

  UserData({required this.cel_number, required this.email,required this.id, required this.name, required this.rol, required this.state});

  factory UserData.fromJson(Map<String, dynamic> data) => _$UserDataFromJson(data);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
