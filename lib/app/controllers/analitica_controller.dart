import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/controllers/ajuste_alarma_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math'; // Importación para generar números aleatorios
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;


class AnaliticaController extends GetxController {
  final ControllerAlarma = Get.find<AjusteAlarmaController>();

  List<double> signalECGVector = []; // Vector con los datos cargados del archivo

  int currentIndexVector = 0; // Índice para recorrer el vector
  int contadorV = 0;
  int contadorF = 0;
  int contadorf = 0;
  int contadorI = 0;
  int contadorN = 0;
  get formKeyAnalitica => null;

  var heartRate = 20.obs; // Valor inicial de 100 bpm
  double signalECG = 0.0; // Ahora es double
  double signalBPM = 0.0;
  
  var tendencia1 =
      ''.obs; // Usamos .obs si estamos usando GetX para observabilidad
  var tendencia2 =
      ''.obs; // Usamos .obs si estamos usando GetX para observabilidad
  var isLowRisk = true.obs; // Estado de riesgo observable
  var heartRateHistory1 = <ChartData1>[].obs; // Historial para el gráfico

  Queue<double> ecgQueue = Queue<double>(); // Cola para almacenar datos
  Queue<double> bpmQueue = Queue<double>(); // Cola para almacenar datos

  List<double> ecgLista = [];
  List<String> predLista = [];
  List<int> bpmLista = [];


  Timer? timer; // Temporizador para la lógica
  int windowSizeEcg = 1250; // 10 segundos (1250 datos)
  int overlapSizeEcg = 125; // 5 segundos (traslape)
  int windowSizeBpm = 625; // 5 segundo (125 datos)
  int overlapSizeBpm = 125; // 90% (traslape)
  int ventanaGuardar = 0;


  final List<String> tendenciasLinea1 = [
    "Mantén una hidratación adecuada.",
    "Mantén una dieta equilibrada.",
    "Evita el consumo excesivo de cafeína."
  ];
  final List<String> tendenciasLinea2 = [
    "Evita el estrés.",
    "Haz ejercicio regularmente.",
    "Practica respiración profunda."
  ];

  int currentIndex = 0;
  int indice = 0;
  int seconds = 0;

  BluetoothCharacteristic? characteristic;
  RxString dataBt = ''.obs; // Observable para datos recibidos
  final box = GetStorage();

  var baseUrl = 'http://10.0.2.2:5000';
  var headers = {'content-type': 'application/json'};


  Future<void> loadHeartRateData() async {
    print("Cargando datos del archivo CSV...");
    try {
      final String rawData = await rootBundle.loadString('assets/vector/full_tiempo_2760.00.csv');
      List<List<dynamic>> csvTable = const CsvToListConverter().convert(rawData);

      // Asumiendo que el CSV es una sola fila de floats
      signalECGVector = csvTable[0].map((value) => double.parse(value.toString())).toList();

      if (signalECGVector.isNotEmpty) {
        print("Datos cargados correctamente. Total de muestras: ${signalECGVector.length}");
      } else {
        print("Error: El archivo CSV está vacío.");
      }
    } catch (e) {
      print("Error al cargar el archivo CSV: $e");
    }
  }


  Future<void> _processAndSendEcg() async {
    // Verifica si hay suficientes datos para enviar
    if (ecgQueue.length >= windowSizeEcg) {
      List<double> ecgToSend = ecgQueue.toList();
      // Envía los datos a la API
      Map<String, dynamic> jsonData = {'data': ecgToSend};
      String jsonStringEcg = jsonEncode(
          jsonData); // Convierte el mapa a una cadena JSON

      print(
          ecgToSend.length); // Esto imprimirá la cantidad de claves en el mapa
      var urlbpm = '$baseUrl/set_ecg/prediccion';
      var responseEcg = await http.post(
          Uri.parse(urlbpm), body: jsonStringEcg, headers: headers);
      String predicionEcg = responseEcg.body;
      predicionEcg = predicionEcg.replaceAll('"', '')
          .trim(); // Elimina las comillas y espacios adicionales
      box.write('ecgPred', predicionEcg);
      predLista.add(box.read('ecgPred'));
      if (predicionEcg == "N") {
        startRiskSimulation(1);
      }
      else {
        startRiskSimulation(0);
      }
      alarmaPrediccion();
    }
  }


  Future<void> _processAndSendBmp() async {
    // Verifica si hay suficientes datos para enviar
    if (bpmQueue.length >= windowSizeBpm) {
      List<double> bmpToSend = bpmQueue.toList();
      // Envía los datos a la API
      Map<String, dynamic> jsonData = {'data': bmpToSend};
      String jsonString = jsonEncode(jsonData);  // Convierte el mapa a una cadena JSON

      print(bmpToSend.length);  // Esto imprimirá la cantidad de claves en el mapa
      var urlbpm = '$baseUrl/set_bpm/prediccion';
      var responseBpm = await http.post(Uri.parse(urlbpm), body: jsonString, headers: headers);
      heartRate.value = int.parse(responseBpm.body);
      bpmLista.add(heartRate.value);
      startTendenciaSimulation();
    }
  }

  Future<void> _guardarDatos() async {
    // Envía los datos a la API
    Map<String, dynamic> jsonData = {
    'id': box.read('id'),
    'ecg': ecgLista,
    'bpm': bpmLista,
    'pred':predLista};
    String dataEviar = jsonEncode(jsonData);  // Convierte el mapa a una cadena JSON
    var urlbpm = '$baseUrl/data_ecg/info';
    var responseBpm = await http.post(Uri.parse(urlbpm), body: dataEviar, headers: headers);
  }




  void updateHeartRateHistory1() {
    if (heartRateHistory1.length >= 10) {
      heartRateHistory1.removeAt(0);
    }
    heartRateHistory1.add(ChartData1(DateTime.now(), heartRate.value));
    heartRateHistory1.refresh(); // Forzar la actualización
  }

  void startTendenciaSimulation() {
    if (heartRate.value > 90){
      tendencia1.value = tendenciasLinea1[2];
      tendencia2.value = tendenciasLinea2[2];
    }else if (heartRate.value > 50){
      tendencia1.value = tendenciasLinea1[1];
      tendencia2.value = tendenciasLinea2[1];
    }else{
      tendencia1.value = tendenciasLinea1[0];
      tendencia2.value = tendenciasLinea2[0];
    }

  }


  // Simulación de frecuencia cardíaca cada 1 segundo con valores aleatorios entre 20 y 150
  void startHeartRateSimulation() {
    final random = Random();
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      // Generar un valor aleatorio entre 20 y 150
      //heartRate.value = int.tryParse(dataBt.value) ?? heartRate.value; // Usar el valor de dataBt
      // Si llegamos al final del vector, detenemos el timer
      if (currentIndex == signalECGVector.length) {
        currentIndexVector = 0;
        seconds = 0;
      }
      
      signalECG = signalECGVector[currentIndexVector];
      signalBPM = signalECGVector[currentIndexVector];
      currentIndexVector++;
      ventanaGuardar++;
     
      // Agrega el dato a la cola
      ecgQueue.add(signalECG);
      bpmQueue.add(signalBPM);
      
      // Si la cola excede la ventana (sin traslape), elimina el más antiguo
      if (ecgQueue.length > windowSizeEcg) {
        for (int i = 0; i < (overlapSizeEcg); i++) {
          ecgQueue.removeFirst();
        }
      }

      if (bpmQueue.length > windowSizeBpm) {
        for (int i = 0; i < (overlapSizeBpm); i++) {
          bpmQueue.removeFirst();
        }
      }

      // Agregar datos a las listas
      ecgLista.add(signalECGVector[currentIndexVector]);
      
      // Imprime los segundos cada 125 iteraciones (~1 segundo si el dato llega cada 8ms)
      if (timer.tick % 125 == 0) {
        seconds++;
        updateHeartRateHistory1(); // Actualiza el historial de frecuencia cardíaca para graficarlo
        print("Segundos transcurridos: $seconds");
      }

      // Imprime los segundos cada 125 iteraciones (~1 segundo si el dato llega cada 8ms)
      if (ventanaGuardar == 37500) {
        ventanaGuardar = 0;
        updateHeartRateHistory1();

        // Guardar o imprimir las listas
        print("Resultados de los últimos 5 minutos:");
        _guardarDatos();
        // Vaciar las listas
        predLista.clear();
        ecgLista.clear();
        bpmLista.clear();

        print("Las listas han sido vaciadas. Preparadas para los siguientes 3 minutos.");
      }


      _processAndSendEcg();
      _processAndSendBmp();

    });
  }

  // Simulación automática del cambio de riesgo (cada 5 segundos)
  void startRiskSimulation(int i) {
    if(i == 1){
      isLowRisk.value = true;
    }
    else {
      isLowRisk.value = false; // Alterna el estado de riesgo
    }
  }

// Función que verifica y genera la alarma
  void alarmaPrediccion() {
    String pred = box.read('ecgPred');  // Leer la predicción

    // Si la predicción es "V", incrementamos el contador para la Contracción Ventricular
    if (pred == "V") {
      contadorV++;
      contadorF = 0;  // Resetear contadores de otras predicciones
      contadorf = 0;
      contadorI = 0;
      contadorN = 0;
    }
    // Si la predicción es "!", incrementamos el contador para la Onda de Aleteo (VFL)
    else if (pred == "!") {
      contadorI++;
      contadorV = 0;  // Resetear contadores de otras predicciones
      contadorf = 0;
      contadorF = 0;
      contadorN = 0;
    }
    // Si la predicción es "F", incrementamos el contador para la Fusión Ventricular-Normal
    else if (pred == "F") {
      contadorF++;
      contadorV = 0;  // Resetear contadores de otras predicciones
      contadorf = 0;
      contadorI = 0;
      contadorN = 0;
    }
    // Si la predicción es "f", incrementamos el contador para la Fusión Rítmica-Normal
    else if (pred == "f") {
      contadorf++;
      contadorV = 0;  // Resetear contadores de otras predicciones
      contadorF = 0;
      contadorI = 0;
      contadorN = 0;
    }
    // Si la predicción es "N", incrementamos el contador para predicciones Normales
    else if (pred == "N") {
      contadorN++;
      contadorV = 0;  // Resetear contadores de otras predicciones
      contadorF = 0;
      contadorf = 0;
      contadorI = 0;
    }
    String fullName = box.read('user_full_name');
    String Nombre_emergencia = box.read('emergency_full_name');
    String telefono_emergencia = box.read('emergency_cel_mobile');
    String aseguradora = box.read('medical_insurance');
    String tipo_asugarora = box.read('medical_type_link');
    String hospital = box.read('doctor_institution');
    String cedula = box.read('user_doc_number');
    String tipoCedula = box.read('user_type_doc');

    // Obtener la fecha y hora actuales
    DateTime now = DateTime.now();
    String dateTimeNow = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    // Información de emergencia
    String dataUser = 'Fecha y hora: $dateTimeNow\n'
        'Mi nombre es $fullName, '
        'mi tipo de documento es $tipoCedula, '
        'y mi número de documento es $cedula.\n'
        'Texto de emergencia: ${ControllerAlarma.TextController.text}\n';

    // Información de ubicación
    String locationMessage = 'Estoy ubicado en: '
        'Latitud ${ControllerAlarma.currentPosition.value!.latitude}, '
        'Longitud ${ControllerAlarma.currentPosition.value!.longitude}, ¡Necesito Ayuda URGENTE!\n';

    // Datos de contacto de emergencia
    String emergencyContact = 'Contacto de emergencia:\n'
        'Nombre: $Nombre_emergencia\n'
        'Teléfono: $telefono_emergencia\n';

    // Información adicional sobre la aseguradora y el hospital
    String medicalInfo = 'Mi aseguradora es $aseguradora, '
        'mi tipo de aseguradora es $tipo_asugarora, '
        'el hospital donde me atienden es $hospital.\n';

// Construcción del mensaje completo
    String fullMessage = '$dataUser$locationMessage$emergencyContact$medicalInfo';

    // Generamos la alarma si se cumple el número de repeticiones consecutivas
    if (contadorV >= 5 && ControllerAlarma.isV.value) {  // 5 ventanas consecutivas para "V"
      generarAlarma("$fullMessage\n"
          "Alerta: Contracción Ventricular Prematura (V)");
          ControllerAlarma.toggleBottomPrueba();
    } else if (contadorI >= 4 && ControllerAlarma.isAle.value) {  // 4 ventanas consecutivas para "!"
      generarAlarma("$fullMessage\n"
          "Alerta: Onda de Aleteo Ventricular (VFL)");
      ControllerAlarma.toggleBottomPrueba();

    } else if (contadorF >= 3 && ControllerAlarma.isF.value) {  // 3 ventanas consecutivas para "F"
      generarAlarma("$fullMessage\n"
          "Alerta: Fusión Ventricular-Normal (F)");
      ControllerAlarma.toggleBottomPrueba();

    } else if (contadorf >= 3 && ControllerAlarma.isf.value) {  // 3 ventanas consecutivas para "f"
      generarAlarma("$fullMessage\n"
          "Alerta: Fusión Rítmo-Normal (f)");
      ControllerAlarma.toggleBottomPrueba();

    }
  }

  // Función para generar la alarma (puede ser un sonido, mensaje o indicador visual)
  Future<void> generarAlarma(String mensaje) async {
    Map<String, dynamic> jsonData = {'data': mensaje,
    'latitud': ControllerAlarma.currentPosition.value!.latitude,
    'longitud': ControllerAlarma.currentPosition.value!.longitude,
    'cel_emergencia': int.parse(box.read('user_number')),
    'cel_contacto': int.parse(box.read('emergency_cel_mobile'))};
    String jsonStringAlerta = jsonEncode(jsonData);  // Convierte el mapa a una cadena JSON
    var urlbpm = '$baseUrl/alerta/info';
    var responseBpm = await http.post(Uri.parse(urlbpm), body: jsonStringAlerta, headers: headers);
  }
}

class ChartData1 {
  final DateTime time;
  final int value;

  ChartData1(this.time, this.value);
}


class HeartRateChart1 extends StatelessWidget {
  final AnaliticaController controller = Get.put(AnaliticaController());

  @override
  Widget build(BuildContext context) {
    // Variables de colores dentro del widget
    return Obx(() {
      Color colorLine;
      Color colorLine1;
      Color colorGraph1;
      Color colorGraph2;

      // Definir las condiciones de color basadas en el valor de heartRate
      if (controller.heartRate.value >= 90) {
        colorLine = Colors.redAccent;
        colorLine1 = Colors.red.withOpacity(1);
        colorGraph1 = Colors.red.withOpacity(0.5);
        colorGraph2 = Colors.redAccent.withOpacity(0);
      } else if (controller.heartRate.value >= 60) {
        colorLine = Colors.blueAccent;
        colorLine1 = Colors.blue.withOpacity(1);
        colorGraph1 = Colors.blue.withOpacity(0.5);
        colorGraph2 = Colors.blueAccent.withOpacity(0);
      } else {
        colorLine = Colors.yellowAccent;
        colorLine1 = Colors.yellow.withOpacity(1);
        colorGraph1 = Colors.yellow.withOpacity(0.5);
        colorGraph2 = Colors.yellowAccent.withOpacity(0);
      }

      // Iniciar la simulación de frecuencia cardíaca
      return Container(
        constraints: const BoxConstraints.expand(height: 160),
        child: SfCartesianChart(
          primaryXAxis: const DateTimeAxis(
            isVisible: false,
          ),
          primaryYAxis: const NumericAxis(
            minimum: 0,
            maximum: 200,
            isVisible: true,
            labelStyle: TextStyle(
              color: AppColors.negro,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            majorGridLines: MajorGridLines(width: 1),
            axisLine: AxisLine(width: 1),
          ),
          series: <SplineAreaSeries<ChartData1, DateTime>>[
            SplineAreaSeries<ChartData1, DateTime>(
              dataSource: controller.heartRateHistory1.toList(),
              xValueMapper: (ChartData1 data, _) => data.time,
              yValueMapper: (ChartData1 data, _) => data.value,
              color: colorLine1, // Color de la línea principal
              borderColor: colorLine, // Color del borde
              borderWidth: 2,
              enableTooltip: true,
              gradient: LinearGradient(
                colors: [
                  colorGraph1, // Color inicial del gradiente
                  colorGraph2, // Color final del gradiente
                ],
                stops: const [0.0, 1.0],
              ),
              animationDuration: 900,
              splineType: SplineType.monotonic,
            ),
          ],
          title: const ChartTitle(text: ''),
          plotAreaBorderWidth: 0, // Eliminar bordes alrededor del gráfico
        ),
      );
    });
  }
}
