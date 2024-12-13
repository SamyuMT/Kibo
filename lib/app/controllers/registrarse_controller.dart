import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/data/provider/register_provider.dart';
import '../data/model/credential/credential.dart';

import '../data/model/credential/credential_data.dart';
import '../routes/pages.dart';



import '../data/model/user/user.dart';
import '../data/model/info_user/info_user.dart';
import '../data/model/emergency_user/emergency_user.dart';
import '../data/model/medical_user/medical_user.dart';
import '../data/model/doctor_user/doctor_user.dart';

import '../data/model/credential/credential.dart';


class RegistrarseController extends GetxController {
  get formKeyRegistrarse => null;

  final RegisterProvider registerProvider = RegisterProvider(); // Instancia del proveedor


  Future<bool> verificarEmail(String email) async {
    try {
      bool verificar = await registerProvider.getEmail(id: email);
      return verificar;
    } catch (e) {
      EasyLoading.showInfo('Error de conexion'.toString()); // Muestra el mensaje de error
      return true; // Retorna 'false' en caso de error
    }
  }

  Future<bool> verificarNumber(String number) async {
    try {
      bool verificar = await registerProvider.getNumber(id: number);
      return verificar;
    } catch (e) {
      EasyLoading.showInfo('Error de conexion'.toString()); // Muestra el mensaje de error
      return true; // Retorna 'false' en caso de error
    }
  }

  void backLoginRegister() {
    Get.toNamed(Routes.LOGINREGISTER);
  }

  var isPasswordAlert = false.obs;
  var isNumberAlert = false.obs;
  var isUserEmail = false.obs;
  var isButtonEnabled = false.obs; // Estado del botón






  final NumberController = TextEditingController(); // Controlador para User
  final EmailController = TextEditingController(); // Controlador para Email

  final passwordController = TextEditingController(); // Controlador para contraseña
  final passwordConfirmController = TextEditingController(); // Controlador para confirmar contraseña



  // Verifica si los campos no están vacíos
  void checkButtonState() {
    if (NumberController.text.isNotEmpty && passwordController.text.isNotEmpty && EmailController.text.isNotEmpty && passwordConfirmController.text.isNotEmpty) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
    print(isButtonEnabled.value);
  }


  Future<void> validateCredentials() async {
    final box = GetStorage();
    if(passwordController.text == passwordConfirmController.text){
      isPasswordAlert.value = false;
      bool emailVerificado = await verificarEmail(EmailController.text);
      bool numberVerificado = await verificarNumber(NumberController.text);
      if(numberVerificado && emailVerificado){
        isUserEmail.value = true;
        isNumberAlert.value = true;
        EasyLoading.showInfo('Numero y correo ya esta en uso'.toString()); // Muestra el mensaje de error
      }
      else if(emailVerificado){
        isUserEmail.value = true;
        isNumberAlert.value = false;

        EasyLoading.showInfo('Correo ya esta en uso'.toString()); // Muestra el mensaje de error
      }
      else if(numberVerificado){
        isNumberAlert.value = true;
        isUserEmail.value = false;
        EasyLoading.showInfo('Numero ya esta en uso'.toString()); // Muestra el mensaje de error
      }

      else{
        isUserEmail.value = false;
        isNumberAlert.value = false;
        box.write('user_email',  EmailController.text);
        box.write('user_number', NumberController.text);
        box.write('user_pass', passwordConfirmController.text);


        EasyLoading.showInfo('Datos Correctos'.toString()); // Muestra el mensaje de error
        clearLoginData();
        Get.toNamed(Routes.REGISTRARSEINFO);
      }
    } else{
      isPasswordAlert.value = true;
      EasyLoading.showInfo('Verifica contraseña'.toString()); // Muestra el mensaje de error
    }

  }
  // Método para limpiar los datos del login
  void clearLoginData() {
    NumberController.clear();
    EmailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    isPasswordAlert.value = false;
    isNumberAlert.value = false;
    isUserEmail.value = false;
    isButtonEnabled.value = false;
  }
}
