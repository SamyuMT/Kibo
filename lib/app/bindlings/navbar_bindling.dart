import 'package:kibo/app/controllers/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
  }
}
