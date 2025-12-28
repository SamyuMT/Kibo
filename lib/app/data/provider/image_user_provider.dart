import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:kibo/app/config/app_config.dart';

class UserImageScreen extends GetConnect {
  Future<Uint8List?> getImageUser({required String imgUrl}) async {
    try {
      final url = Uri.parse(
          '${AppConfig.apiBaseUrl}/get_image_user/img?img_url=$imgUrl');
      final client = HttpClient();
      final request = await client.getUrl(url);

      // Agregar headers con la API key
      AppConfig.defaultHeaders.forEach((key, value) {
        request.headers.add(key, value);
      });

      final response = await request.close();

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        // Leer los bytes de la respuesta
        final bytes = await consolidateHttpClientResponseBytes(response);
        return bytes; // Devolver los bytes de la imagen
      } else {
        print('Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error connecting: $e');
      return null;
    }
  }
}
