import 'package:kibo/app/controllers/analitica_controller.dart';
import 'package:get/get.dart';

class AnaliticaBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnaliticaController>(() => AnaliticaController());
  }
}
