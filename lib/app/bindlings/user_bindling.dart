import 'package:kibo/app/controllers/user_controller.dart';
import 'package:get/get.dart';

class UserBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
