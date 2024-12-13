import 'package:json_annotation/json_annotation.dart';
import 'credential_data.dart';
part 'credential.g.dart';

@JsonSerializable(explicitToJson: true)
class Credential {
  CredentialData data;
  String message;
  bool status;

  Credential({
    required this.data,
    required this.message,
    required this.status
  });

  factory Credential.fromJson(Map<String, dynamic> data) =>
      _$CredentialFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);

  // Create a new CredentialData object from the provided string
  void updateCredentialData(CredentialData dt) {
    data = dt; // Use the constructor of CredentialData
  }

  void updateMessage(String dt) {
    message = dt; // Use the constructor of CredentialData
  }

  void updateStatus(bool dt) {
    status = dt; // Use the constructor of CredentialData
  }


}