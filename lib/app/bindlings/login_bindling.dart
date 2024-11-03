import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
