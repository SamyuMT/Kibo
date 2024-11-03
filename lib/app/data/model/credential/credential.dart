import 'package:json_annotation/json_annotation.dart';
import 'credential_data.dart';
part 'credential.g.dart';

@JsonSerializable(explicitToJson: true)
class Credential {
  String message;
  bool status;
  CredentialData data;

  Credential({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Credential.fromJson(Map<String, dynamic> data) =>
      _$CredentialFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}
