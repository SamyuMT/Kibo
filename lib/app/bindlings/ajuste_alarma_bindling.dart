import 'package:kibo/app/controllers/ajuste_alarma_controller.dart';
import 'package:get/get.dart';

class AjusteAlarmaBindling implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjusteAlarmaController>(() => AjusteAlarmaController());
  }
}
