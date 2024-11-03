import 'package:kibo/app/routes/pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  get formKeyHome => null;
  var activate = false.obs; // Observable
  // Función para activar/desactivar Bluetooth
  void activateBluetooth() {
    // Cambia el estado de activate
    activate.value = !activate.value;

    // Aquí podrías agregar lógica adicional para activar o desactivar Bluetooth
    // Por ejemplo, conectarte a un dispositivo, etc.
    if (activate.value) {
      print("Bluetooth Activado");
      // Código para activar Bluetooth
    } else {
      print("Bluetooth Desactivado");
      // Código para desactivar Bluetooth
    }
  }
}
