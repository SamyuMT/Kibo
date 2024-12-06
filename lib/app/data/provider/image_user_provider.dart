import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

const baseUrl = 'http://10.0.2.2:5000';

class UserImageScreen extends GetConnect {
  Future<Uint8List?> getImageUser({required String imgUrl}) async {
    try {
      final response = await HttpClient().getUrl(Uri.parse('$baseUrl/get_image_user/img?img_url=$imgUrl'));
      final result = await response.close();
      if (result.statusCode == 200) {
        print('Response status: ${result.statusCode}');
        // Leer los bytes de la respuesta
        final bytes = await consolidateHttpClientResponseBytes(result);
        return bytes; // Devolver los bytes de la imagen
      } else {
        print('Error: Status code ${result.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error connecting: $e');
      return null;
    }
  }
}