import 'package:kibo/app/controllers/loginOrRegister_controller.dart';
import 'package:get/get.dart';

class LoginorregisterBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginorregisterController>(() => LoginorregisterController());
  }
}
