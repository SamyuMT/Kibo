import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kibo/app/controllers/analitica_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  get formKeyHome => null;
  var isBluetoothEnabled = false.obs; // Observable para el estado de Bluetooth
  var isPermissionGranted = false.obs; // Observable para el estado de permisos
  // Lista de dispositivos encontrados
  var availableDevices = <BluetoothDevice>[].obs;
  var pairedDevices = <BluetoothDevice>[].obs;
  BluetoothDevice? connectedDevice;


  var receivedData = "".obs; // Observable para almacenar los datos recibidos
  BluetoothCharacteristic? characteristic;
  var conect = false.obs;



  // Función para escanear dispositivos Bluetooth
// Función para escanear dispositivos Bluetooth y obtener dispositivos vinculados
  Future<void> scanDevices() async {
    // Limpia ambas listas antes de un nuevo escaneo
    availableDevices.clear();
    pairedDevices.clear();

    // Obtener dispositivos vinculados (ya conectados)
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    pairedDevices.addAll(connectedDevices);

    // Inicia el escaneo de dispositivos disponibles
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    // Escucha los dispositivos encontrados y agrégalos a la lista
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!availableDevices.contains(result.device)) {
          availableDevices.add(result.device);
        }
      }
    });

    // Detiene el escaneo después del tiempo límite
    await Future.delayed(const Duration(seconds: 4));
    FlutterBluePlus.stopScan();
  }


  // Conectarse al dispositivo seleccionado
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      print('Conectado a ${device.name}');
      connectedDevice = device; // Guarda el dispositivo conectado
      escucharDatos(device); // Llama a escucharDatos después de conectar

    } catch (e) {
      print('Error al conectar: $e');
    }
  }

  // Función para escuchar los datos de un dispositivo Bluetooth conectado
  void escucharDatos(BluetoothDevice device) async {
    try {
      // Descubre servicios y características del dispositivo
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        for (var char in service.characteristics) {
          // Verifica si la característica permite notificaciones
          if (char.properties.notify) {
            characteristic = char;
            await characteristic!.setNotifyValue(true);

            // Escucha los cambios de valor en la característica
            characteristic!.value.listen((value) {
              // Convierte los datos a string y actualiza el observable
              receivedData.value = String.fromCharCodes(value);
              print('Datos recibidos: ${receivedData.value}');
            });
          }
        }
      }
    } catch (e) {
      print('Error al escuchar datos: $e');
    }
  }

  // Revisa el estado inicial de Bluetooth y permisos
  Future<void> checkBluetoothStatus() async {
    final bluetoothState = await FlutterBluePlus.isOn;
    isBluetoothEnabled.value = bluetoothState;

    final permissionStatus = await Permission.bluetoothConnect.request();
    isPermissionGranted.value = permissionStatus.isGranted;
  }

  // Activa Bluetooth y solicita permisos si es necesario
  Future<void> activateBluetooth() async {
    final status = await Permission.bluetoothConnect.request();
    if (status.isGranted) {
      isPermissionGranted.value = true;

      if (!isBluetoothEnabled.value) {
        // Si Bluetooth está apagado, sugiere al usuario activarlo manualmente
        Get.defaultDialog(
          title: 'Activar Bluetooth',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Por favor, activa Bluetooth desde la configuración.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20), // Espaciado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      openBluetoothSettings();
                    },
                    child: const Text("Ir a Configuración",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Verifica el estado después de regresar
                      await checkBluetoothStatus();
                      if (isBluetoothEnabled.value) {
                        print("Bluetooth activado en la app.");
                        Get.back(); // Cierra el diálogo si Bluetooth está activado

                      } else {
                        Get.snackbar(
                          "Error", // Título de la snackbar
                          "Bluetooth sigue desactivado. Intenta nuevamente.", // Mensaje
                          titleText: const Text(
                            "Error",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          messageText: const Text(
                            "Bluetooth sigue desactivado. Intenta nuevamente.",
                            style: TextStyle(
                              fontFamily: 'Poppins', // Puedes personalizar el estilo del mensaje aquí también
                              fontSize: 12,
                            ),
                          ),
                          snackPosition: SnackPosition.TOP, // Posición de la snackbar (opcional)
                          duration: Duration(seconds: 3), // Duración de la snackbar (opcional)
                        );
                      }
                    },
                    child: const Text("Verificar", style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),),
                  ),
                ],
              ),
            ],
          ),
          cancel: ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text("Cancelar", style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),),
          ),
        );
      }
    } else {
      print("Permiso de Bluetooth denegado.");
    }
  }

  // Desactiva Bluetooth y actualiza el estado
  Future<void> deactivateBluetooth() async {
    if (isBluetoothEnabled.value) {
      // Intenta desactivar Bluetooth en la app
      // Aquí puedes agregar lógica para desactivar el Bluetooth
      // Sin embargo, FlutterBlue no proporciona un método directo para desactivar Bluetooth
      // en la app, pero puedes manejarlo como si estuvieras desactivando.

      isBluetoothEnabled.value = false; // Cambiar el estado de Bluetooth en la app
      print("Bluetooth desactivado en la app.");
    }
  }

  // Abre la configuración de Bluetooth en Android
  void openBluetoothSettings() {
    const intent = AndroidIntent(
      action: 'android.settings.BLUETOOTH_SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    intent.launch();
  }
}