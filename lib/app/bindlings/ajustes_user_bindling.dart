import 'package:kibo/app/controllers/ajustes_user_controller.dart';
import 'package:get/get.dart';

class AjustesUserBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjustesUserController>(() => AjustesUserController());
  }
}
