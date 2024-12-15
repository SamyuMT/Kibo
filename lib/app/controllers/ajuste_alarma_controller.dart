import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';

class AjusteAlarmaController extends GetxController {
  final box = GetStorage();

  final FlutterLocalNotificationsPlugin notificacion =
      FlutterLocalNotificationsPlugin();

  final TextController = TextEditingController(); // Controlador para User

  var currentPosition = Rxn<Position>(); // Observable para la ubicación actual
  StreamSubscription<Position>? positionStream;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Future<void> onInit() async {
    super.onInit();
    await solicitarPermisoUbicacion(); // Espera a que se complete la solicitud de permiso de ubicación
    await solicitarPermisoNotificaciones(); // Solicita el permiso de notificación solo después de que el permiso de ubicación se conceda
    initNotifications(); // Inicializar las notificaciones aquí

  }

  void _playAlarmSound() async {
    // Reproduce el sonido de la alarma (reemplaza 'assets/alarm_sound.mp3' por tu archivo de sonido)
    await _audioPlayer.play(AssetSource('sounds/cardiaco.mp3'));
    // Detener el sonido después de 2500 milisegundos
    Timer(const Duration(milliseconds: 12000), () {
      _audioPlayer.stop();
    });
  }

  Future<void> solicitarPermisoUbicacion() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request(); // Solicitar permiso de ubicación
    } else if (await Permission.location.isPermanentlyDenied) {
      openAppSettings(); // Abrir ajustes si el permiso está permanentemente denegado
    }
  }

  Future<void> solicitarPermisoNotificaciones() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request(); // Solicitar permiso
    } else if (await Permission.notification.isPermanentlyDenied) {
      openAppSettings(); // Abrir ajustes si el permiso está permanentemente denegado
    }
  }

  Future<void> initNotifications() async {
    const AndroidInitializationSettings androidInicializar =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInicializar);

    await notificacion.initialize(initializationSettings);
  }

  Future<Position> determinPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permisos de ubicación denegados');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'id_canal',
      'Nombre del Canal',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await notificacion.show(0, title, body, notificationDetails);
  }
  get formKeyAnalitica => null;

  // Variable que controla el estado del switch (true = on, false = off)
  var isAlarmaOn = false.obs;
  var isMapOn = false.obs;
  var isV = false.obs;
  var isAle = false.obs;
  var isF = false.obs;
  var isf = false.obs;

  // Función para cambiar el estado del mapa y obtener la ubicación
  void toggleMap(bool value) {
    isMapOn.value = value;
    print('Map: ${isMapOn.value}');
    if (isMapOn.value) {
      startLocationUpdates(); // Inicia la actualización continua de la ubicación
    } else {
      currentPosition.value =
          null; // Limpiamos la posición si se desactiva el mapa
      stopLocationUpdates(); // Detiene la actualización continua
    }
  }

  // Función para obtener la ubicación actual una vez
  void getCurrentLocation() async {
    try {
      Position position = await determinPosition();
      currentPosition.value = position; // Actualiza el observable
      print('Latitud: ${position.latitude}, Altitud: ${position.altitude}');
    } catch (e) {
      print('Error obteniendo la ubicación: $e');
    }
  }

  // Función para empezar a obtener actualizaciones continuas de la ubicación
  void startLocationUpdates() {
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high, // Precisión de la ubicación
        distanceFilter:
            5, // Actualiza cuando la posición cambia por al menos 10 metros
      ),
    ).listen((Position position) {
      currentPosition.value = position; // Actualiza la posición en tiempo real
      print('Ubicación:');
      print(
          'Ubicación actualizada: Latitud ${position.latitude}, Longitud ${position.longitude}');
    });
  }

  // Función para detener las actualizaciones de ubicación
  void stopLocationUpdates() {
    positionStream?.cancel();
  }

  void toggleBottomPrueba() {
    String fullName = box.read('user_full_name');
    String Nombre_emergencia = box.read('emergency_full_name');
    String telefono_emergencia = box.read('emergency_cel_mobile');
    String cedula = box.read('user_doc_number');

    // Datos de contacto de emergencia
    String emergencyContact = 'Contacto de emergencia:\n'
        'Nombre: $Nombre_emergencia\n'
        'Teléfono: $telefono_emergencia\n';

    // Información de emergencia
    String dataUser = 'Mi nombre es $fullName\n, '
        'y mi número de documento es $cedula.\n'
        'Texto de emergencia: ${TextController.text}\n';

    String dateTimeNow = '$dataUser-$emergencyContact';

    if (currentPosition.value != null) {
      // Mostrar notificación
      showNotification('Alerta de emergencia', dateTimeNow);
      EasyLoading.showInfo(dateTimeNow,
          duration: const Duration(milliseconds: 12000));
      // Reproducir sonido de alarma
      _playAlarmSound();
    } else {
      print('No hay ubicación');
      String noLocationMessage = 'No hay ubicación, ¡Habilítela!';
      showNotification('Sin ubicación', noLocationMessage);
      EasyLoading.showInfo(noLocationMessage,
          duration: const Duration(milliseconds: 2500));
    }
  }

  // Función que cambia el estado del switch
  void toggleAlarma(bool value) {
    isAlarmaOn.value = value;
    print('Alarma: ${isAlarmaOn.value}');
  }

  // Función que cambia el estado del switch
  void toggleV(bool value) {
    isV.value = value;
    print('V: ${isV.value}');
  }

  // Función que cambia el estado del switch
  void toggleAle(bool value) {
    isAle.value = value;
    print('!: ${isAle.value}');
  }

  // Función que cambia el estado del switch
  void toggleF(bool value) {
    isF.value = value;
    print('F: ${isF.value}');
  }

  // Función que cambia el estado del switch
  void togglef(bool value) {
    isf.value = value;
    print('f: ${isf.value}');
  }

  // Función que cambia el estado del switch según el id
  void toggleState(String id, bool value) {
    if (id == 'Alarma') {
      toggleAlarma(value);
      if (isAlarmaOn.value == true) {
        toggleV(value);
        togglef(value);
        toggleF(value);
        toggleAle(value);
      }
    } else if (id == 'Map') {
      toggleMap(value);
    } else if (id == 'V') {
      toggleV(value);
    } else if (id == '!') {
      toggleAle(value); // Supongamos que 'Ale' corresponde a isAle
    } else if (id == 'F') {
      toggleF(value); // Supongamos que 'F' corresponde a isF
    } else if (id == 'f') {
      togglef(value); // Supongamos que 'f' corresponde a isf
    }
  }
}
