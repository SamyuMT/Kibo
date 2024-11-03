import 'package:kibo/app/controllers/registrarse_controller.dart';
import 'package:get/get.dart';

class RegistrarseBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrarseController>(() => RegistrarseController());
  }
}
