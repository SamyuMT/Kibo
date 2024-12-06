import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  String img_url;
  String last_name;
  String name;
  String nick_name;
  String rol;
  bool state;

  UserData({required this.img_url, required this.last_name,required this.name, required this.nick_name, required this.rol, required this.state});

  factory UserData.fromJson(Map<String, dynamic> data) => _$UserDataFromJson(data);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
