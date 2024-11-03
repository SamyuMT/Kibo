import 'package:kibo/app/controllers/start01_controller.dart';
import 'package:get/get.dart';

class Start01Bindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Start01Controller>(() => Start01Controller());
  }
}
