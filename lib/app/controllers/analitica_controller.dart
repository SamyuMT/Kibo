import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math'; // Importación para generar números aleatorios
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;


class AnaliticaController extends GetxController {
  List<double> signalECGVector = []; // Vector con los datos cargados del archivo

  int currentIndexVector = 0; // Índice para recorrer el vector

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

  Timer? timer; // Temporizador para la lógica
  int windowSizeEcg = 1250; // 10 segundos (1250 datos)
  int overlapSizeEcg = 625; // 5 segundos (traslape)
  int windowSizeBpm = 625; // 5 segundo (125 datos)
  int overlapSizeBpm = 125; // 90% (traslape)

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
      String jsonStringEcg = jsonEncode(jsonData);  // Convierte el mapa a una cadena JSON

      print(ecgToSend.length);  // Esto imprimirá la cantidad de claves en el mapa
      var urlbpm = '$baseUrl/set_ecg/prediccion';
      var response = await http.post(Uri.parse(urlbpm), body: jsonStringEcg, headers: headers);
      startRiskSimulation();
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
      var response = await http.post(Uri.parse(urlbpm), body: jsonString, headers: headers);
      heartRate.value = int.parse(response.body);
      startTendenciaSimulation();
    }
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
      }
      
      signalECG = signalECGVector[currentIndexVector];
      signalBPM = signalECGVector[currentIndexVector];
      currentIndexVector++;
      
     
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
      
      // Imprime los segundos cada 125 iteraciones (~1 segundo si el dato llega cada 8ms)
      if (timer.tick % 125 == 0) {
        seconds++;
        updateHeartRateHistory1(); // Actualiza el historial de frecuencia cardíaca para graficarlo
        print("Segundos transcurridos: $seconds");
      }
      _processAndSendEcg();
      _processAndSendBmp();
    });
  }

  // Simulación automática del cambio de riesgo (cada 5 segundos)
  void startRiskSimulation() {
      isLowRisk.value = !isLowRisk.value; // Alterna el estado de riesgo
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
    // Iniciar la simulación de frecuencia cardíaca
    return Obx(() => Container(
          constraints: const BoxConstraints.expand(height: 160),
          child: SfCartesianChart(
            primaryXAxis: const DateTimeAxis(
              isVisible: false,
            ),
            primaryYAxis: const NumericAxis(
              minimum: 0,
              maximum: 200,
              isVisible: true,
              labelStyle: const TextStyle(
                color: AppColors.negro,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              // Color de las etiquetas
              // Hacer el eje Y visible
              majorGridLines: MajorGridLines(width: 1),
              // Sin líneas de cuadrícula
              axisLine: AxisLine(width: 1),
              // Sin línea de eje
            ),
            series: <SplineAreaSeries<ChartData1, DateTime>>[
              SplineAreaSeries<ChartData1, DateTime>(
                dataSource: controller.heartRateHistory1.toList(),
                xValueMapper: (ChartData1 data, _) => data.time,
                yValueMapper: (ChartData1 data, _) => data.value,
                // Cambiar el color a rojo carmesí con degradado
                color: Colors.red.withOpacity(1),
                borderColor: Colors.redAccent,
                // Color del borde
                borderWidth: 2,
                enableTooltip: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.red.withOpacity(0.5), // Rojo carmesí
                    Colors.redAccent.withOpacity(0), // Transparente
                  ],
                  stops: const [0.0, 1.0],
                ),
                animationDuration: 900,
                // Suavizar la animación
                splineType: SplineType.monotonic, // Para una curva más suave
              ),
            ],
            title: const ChartTitle(text: ''),
            plotAreaBorderWidth: 0, // Eliminar bordes alrededor del gráfico
          ),
        ));
  }
}
