import 'package:get/get_connect/connect.dart';
import 'package:kibo/app/config/app_config.dart';

class LoginProvider extends GetConnect {
  Future<Response> getDataCredential(
      {required String credential, required String pass}) async {
    final url =
        "${AppConfig.apiBaseUrl}/get_credential/login?credential=$credential&pass=$pass";
    final raw = await get(
      url,
      headers: AppConfig.defaultHeaders,
    ).timeout(const Duration(milliseconds: 8000));

    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 400) {
      final message = raw.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }
}
