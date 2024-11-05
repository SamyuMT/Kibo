import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math'; // Importación para generar números aleatorios

class AnaliticaController extends GetxController {

  get formKeyAnalitica => null;

  var heartRate = 20.obs; // Valor inicial de 100 bpm
  var tendencia1 =
      ''.obs; // Usamos .obs si estamos usando GetX para observabilidad
  var tendencia2 =
      ''.obs; // Usamos .obs si estamos usando GetX para observabilidad
  var isLowRisk = true.obs; // Estado de riesgo observable
  var heartRateHistory1 = <ChartData1>[].obs; // Historial para el gráfico

  final List<String> tendenciasLinea1 = [
    "Poseen una tendencia saludable",
    "Posee una tendencia no saludable"
  ];
  final List<String> tendenciasLinea2 = [
    "Siga reduciendo el azúcar",
    "Acuda a revisión médica"
  ];

  int currentIndex = 0;
  int indice = 0;

  BluetoothCharacteristic? characteristic;
  RxString dataBt = ''.obs; // Observable para datos recibidos


  void updateHeartRateHistory1() {
    if (heartRateHistory1.length >= 10) {
      heartRateHistory1.removeAt(0);
    }
    heartRateHistory1.add(ChartData1(DateTime.now(), heartRate.value));
    heartRateHistory1.refresh(); // Forzar la actualización
  }

  void startTendenciaSimulation() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      // Actualiza las tendencias con el siguiente valor en las listas
      tendencia1.value = tendenciasLinea1[indice];
      tendencia2.value = tendenciasLinea2[indice];

      // Cicla a través de las listas
      indice = (indice + 1) % tendenciasLinea1.length;
    });
  }


  // Simulación de frecuencia cardíaca cada 1 segundo con valores aleatorios entre 20 y 150
  void startHeartRateSimulation() {
    final random = Random();

    Timer.periodic(const Duration(milliseconds: 800), (timer) {
      // Generar un valor aleatorio entre 20 y 150
      heartRate.value = int.tryParse(dataBt.value) ?? heartRate.value; // Usar el valor de dataBt
      //heartRate.value = 40 + random.nextInt(110);

      updateHeartRateHistory1(); // Actualiza el historial de frecuencia cardíaca para graficarlo
    });
  }

  // Simulación automática del cambio de riesgo (cada 5 segundos)
  void startRiskSimulation() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      isLowRisk.value = !isLowRisk.value; // Alterna el estado de riesgo
    });
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
          constraints: const BoxConstraints.expand(height: 200),
          child: SfCartesianChart(
            primaryXAxis: const DateTimeAxis(
              isVisible: false,
            ),
            primaryYAxis: const NumericAxis(
              minimum: 0,
              maximum: 150,
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
                animationDuration: 600,
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
