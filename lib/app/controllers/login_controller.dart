import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginController extends GetxController {
  final UserController = TextEditingController(); // Controlador para User
  final passwordController =
      TextEditingController(); // Controlador para contraseña
  get formKeyLogin => null;

  var isPasswordAlert = false.obs;
  var isUserAlert = false.obs;
  var isButtonEnabled = false.obs; // Estado del botón

  // Verifica si los campos no están vacíos
  void checkButtonState() {
    if (UserController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
    print(isButtonEnabled.value);
  }

  void validateCredentials() {
    const List<String> correctUser = [
      'jemycraft12@hotmail.com',
      '3052264620'
    ]; // User correcto
    const String correctPassword = '1234'; // Contraseña correcta

    // Verifica si el correo y la contraseña son correctos
    if (!correctUser.contains(UserController.text)) {
      isUserAlert.value = true;
    } else {
      isUserAlert.value = false; // Restablece la alerta si son correctos
    }
    if (passwordController.text != correctPassword) {
      isPasswordAlert.value = true;
    } else {
      isPasswordAlert.value = false; // Restablece la alerta si son correctos
    }

    try {
      if (isPasswordAlert.value || isUserAlert.value) {
        throw 'Credenciales incorrectas'; // Si hay error en el User o password, lanza la excepción
      } else {
        EasyLoading.showSuccess('Inicio de sesión exitoso');
        clearLoginData(); // Limpia la información antes de navegar
        Get.toNamed(Routes.NAVBAR);
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString()); // Muestra el mensaje de error
    }
  }

  // Método para limpiar los datos del login
  void clearLoginData() {
    UserController.clear();
    passwordController.clear();
    isPasswordAlert.value = false;
    isUserAlert.value = false;
    isButtonEnabled.value = false;
  }

  void backLoginRegister() {
    Get.toNamed(Routes.LOGINREGISTER);
  }

  @override
  void onClose() {
    // Asegúrate de limpiar los controladores al cerrar el controlador
    UserController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
