import 'package:json_annotation/json_annotation.dart';
part 'credential_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CredentialData {
  String cel_number;
  String email;
  String id;
  bool state;

  CredentialData({required this.cel_number, required this.email,required this.id, required this.state});

  factory CredentialData.fromJson(Map<String, dynamic> data) => _$CredentialDataFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialDataToJson(this);
}
