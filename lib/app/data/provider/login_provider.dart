import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:kibo/app/data/model/credential/credential.dart';

const baseUrl = 'https://bionovacali.xyz';

class LoginProvider extends GetConnect {
  Future<Response> getDataCredential({required String credential, required String pass}) async{
    final raw =  await get("$baseUrl/get_credential/login?credential=$credential&pass=$pass").
    timeout(const Duration(milliseconds: 8000));
    if(raw.statusCode == 200) {
      return raw;
    } else if(raw.statusCode == 400) {
      final message = raw.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }
}
