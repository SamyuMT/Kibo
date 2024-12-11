import 'dart:io';
import 'package:get/get_connect/connect.dart';

const baseUrl = 'http://10.0.2.2:5000';

class RegisterProvider extends GetConnect {
  Future<bool> getEmail({required String id}) async {
    try {
      final result =  await get("$baseUrl/get_validar_email/info?email=$id").
      timeout(const Duration(milliseconds: 8000));
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
      final result =  await get("$baseUrl/get_validar_number/info?number=$id").
      timeout(const Duration(milliseconds: 8000));
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