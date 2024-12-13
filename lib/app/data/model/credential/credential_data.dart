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

  void updateCelNumber(String newCelNumber) {
    // Optional: Add validation logic here
    cel_number = newCelNumber;
  }

  void updateEmail(String newEmail) {
    // Optional: Add validation logic here
    email = newEmail;
  }

  void updateId(String newId) {
    // Optional: Add validation logic here
    id = newId;
  }

  void updateState(bool newState) {
    state = newState;
  }
}
