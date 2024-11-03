import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
