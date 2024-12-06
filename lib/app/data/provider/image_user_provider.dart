import 'dart:typed_data';
import 'package:get/get_connect/connect.dart';

const baseUrl = 'http://10.0.2.2:5000';

class UserImageScreen extends GetConnect {
  Future<Uint8List?> getImageUser({required String imgUrl}) async {
    final response = await get("$baseUrl/get_image_user/$imgUrl",
        headers: {'Accept': 'image/jpeg'}) // Asegura que aceptas una imagen.
        .timeout(const Duration(milliseconds: 8000));

    if (response.statusCode == 200) {
      return response.body; // Devuelve los bytes de la imagen.
    } else {
      return null; // Maneja errores adecuadamente.
    }
  }
}
