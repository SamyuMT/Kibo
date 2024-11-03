import 'package:kibo/app/routes/pages.dart';
import 'package:get/get.dart';

class LoginorregisterController extends GetxController {
  void ingresarSesion() {
    Get.toNamed(Routes.LOGIN);
    print('Iniciar sesión presionado');
  }

  void ingresarIncribirse() {
    Get.toNamed(Routes.REGISTRARSE);
    print('Registrarse presionado');
  }

  void ingresarGoogle(String platformName) {
    print('1. Iniciar sesión con $platformName');
  }

  void ingresarFacebook(String platformName) {
    print('2. Iniciar sesión con $platformName');
  }

  void ingresarApple(String platformName) {
    print('3. Iniciar sesión con $platformName');
  }
}
