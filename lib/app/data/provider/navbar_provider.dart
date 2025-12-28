import 'package:get/get_connect/connect.dart';
import 'package:kibo/app/config/app_config.dart';

class NavbarProvider extends GetConnect {
  Future<Response> getUser({required String id}) async {
    final url = "${AppConfig.apiBaseUrl}/get_user/info?id_user=$id";
    final user = await get(url, headers: AppConfig.defaultHeaders)
        .timeout(const Duration(milliseconds: 8000));

    if (user.statusCode == 200) {
      return user;
    } else if (user.statusCode == 400) {
      final message = user.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getUserInfo({required String id}) async {
    final url = "${AppConfig.apiBaseUrl}/get_user_info/info?id_user=$id";
    final userInfo = await get(url, headers: AppConfig.defaultHeaders)
        .timeout(const Duration(milliseconds: 8000));

    if (userInfo.statusCode == 200) {
      return userInfo;
    } else if (userInfo.statusCode == 400) {
      final message = userInfo.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getUserEmergency({required String id}) async {
    final url = "${AppConfig.apiBaseUrl}/get_user_emergency/info?id_user=$id";
    final userEmergency = await get(url, headers: AppConfig.defaultHeaders)
        .timeout(const Duration(milliseconds: 8000));

    if (userEmergency.statusCode == 200) {
      return userEmergency;
    } else if (userEmergency.statusCode == 400) {
      final message = userEmergency.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getMedical({required String id}) async {
    final url = "${AppConfig.apiBaseUrl}/get_medical_info/info?id_user=$id";
    final userMedical = await get(url, headers: AppConfig.defaultHeaders)
        .timeout(const Duration(milliseconds: 8000));

    if (userMedical.statusCode == 200) {
      return userMedical;
    } else if (userMedical.statusCode == 400) {
      final message = userMedical.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getDoctorUser({required String id}) async {
    final url = "${AppConfig.apiBaseUrl}/get_doctor/info?id_doctor=$id";
    final doctorUser = await get(url, headers: AppConfig.defaultHeaders)
        .timeout(const Duration(milliseconds: 8000));

    if (doctorUser.statusCode == 200) {
      return doctorUser;
    } else if (doctorUser.statusCode == 400) {
      final message = doctorUser.body["error"];
      throw message;
    } else {
      throw 'Problemas de conexion';
    }
  }
}
