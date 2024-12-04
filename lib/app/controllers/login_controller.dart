import 'package:kibo/app/data/provider/login_provider.dart';
import 'package:kibo/app/data/repository/login_repository.dart';
import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/model/user/user.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();

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

  void validateCredentials() async {
    try {
    User user = await getDataUser();
    List<String> correctUser = [
      user.data.email,
      user.data.cel_number
    ]; // User correcto
    String id = user.data.id;
    // Verifica si el correo y la contraseña son correctos
    if (correctUser.contains(UserController.text)) {
      isUserAlert.value = false;
      isPasswordAlert.value = false;
    }
    if (!isPasswordAlert.value || !isUserAlert.value) {
      EasyLoading.showSuccess('Inicio de sesión exitoso.\n'
          'Bienevenido $id');
      clearLoginData(); // Limpia la información antes de navegar
      Get.toNamed(Routes.NAVBAR);
    }
    } catch (e) {
      EasyLoading.showInfo(e.toString()); // Muestra el mensaje de error
      isUserAlert.value = true;
      isPasswordAlert.value = true;

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
  Future<User> getDataUser() async{
    User body = await loginRepository.getDataUser(credential: UserController.text, pass: passwordController.text);
    return body;
  }

  @override
  void onReady() {
    super.onReady();
  }
  void onClose() {
    // Asegúrate de limpiar los controladores al cerrar el controlador
    UserController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
