import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_connect/connect.dart';

const baseUrl = 'http://10.0.2.2:5000';

class NavbarProvider extends GetConnect {
  Future<Response> getUser({required String id}) async{
    final user =  await get("$baseUrl/get_user/info?id_user=$id").
    timeout(const Duration(milliseconds: 8000));


    if(user.statusCode == 200) {
      return user;
    } else if(user.statusCode == 400) {
      final message = user.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getUserInfo({required String id}) async{
    final userInfo =  await get("$baseUrl/get_user_info/info?id_user=$id").
    timeout(const Duration(milliseconds: 8000));


    if(userInfo.statusCode == 200) {
      return userInfo;
    } else if(userInfo.statusCode == 400) {
      final message = userInfo.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getUserEmergency({required String id}) async{
    final userEmergency =  await get("$baseUrl/get_user_emergency/info?id_user=$id").
    timeout(const Duration(milliseconds: 8000));


    if(userEmergency.statusCode == 200) {
      return userEmergency;
    } else if(userEmergency.statusCode == 400) {
      final message = userEmergency.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getMedical({required String id}) async{
    final userMedical =  await get("$baseUrl/get_medical_info/info?id_user=$id").
    timeout(const Duration(milliseconds: 8000));

    if(userMedical.statusCode == 200) {
      return userMedical;
    } else if(userMedical.statusCode == 400) {
      final message = userMedical.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }

  Future<Response> getDoctorUser({required String id}) async{
    final doctorUser =  await get("$baseUrl/get_doctor/info?id_doctor=$id").
    timeout(const Duration(milliseconds: 8000));

    if(doctorUser.statusCode == 200) {
      return doctorUser;
    } else if(doctorUser.statusCode == 400) {
      final message = doctorUser.body["error"];
      throw message;
    } else{
      throw 'Problemas de conexion';
    }
  }



}


