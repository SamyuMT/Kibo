import 'package:get/get_connect/connect.dart';
import 'package:kibo/app/config/app_config.dart';

class RegisterProvider extends GetConnect {
  Future<bool> getEmail({required String id}) async {
    try {
      final url = "${AppConfig.apiBaseUrl}/get_validar_email/info?email=$id";
      final result = await get(url, headers: AppConfig.defaultHeaders)
          .timeout(const Duration(milliseconds: 8000));
      bool validez = false;
      if (result.statusCode == 200) {
        print('Response status: ${result.body}');
        // Leer los bytes de la respuesta
        validez = true;
        return validez; // Devolver los bytes de la imagen
      } else {
        print('Error: Status code ${result.statusCode}');
        return validez;
      }
    } catch (e) {
      throw 'Problemas de conexion';
    }
  }

  Future<bool> getNumber({required String id}) async {
    try {
      final url = "${AppConfig.apiBaseUrl}/get_validar_number/info?number=$id";
      final result = await get(url, headers: AppConfig.defaultHeaders)
          .timeout(const Duration(milliseconds: 8000));
      bool validez = false;
      if (result.statusCode == 200) {
        print('Response status: ${result.body}');
        // Leer los bytes de la respuesta
        validez = true;
        return validez; // Devolver los bytes de la imagen
      } else {
        print('Error: Status code ${result.statusCode}');
        return validez;
      }
    } catch (e) {
      throw 'Problemas de conexion';
    }
  }
}
