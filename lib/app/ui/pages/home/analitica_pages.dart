import 'package:kibo/app/controllers/analitica_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AnaliticaPage extends GetView<AnaliticaController> {
  const AnaliticaPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.azul,
        resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
        body: SafeArea(
          child: GetBuilder<AnaliticaController>(
              init: AnaliticaController(),
              builder: (AnaliticaController) {
                return Form(
                  key: AnaliticaController.formKeyAnalitica,
                  child: Contenedor(controller: AnaliticaController),
                );
              }),
        ),
      );
}

class Contenedor extends StatelessWidget {
  final AnaliticaController controller;

  const Contenedor({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(gradient: AppColors.principal),
        child: Column(
          children: [
            Expanded(
              // El widget Central se expande
              child: Central(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}

class Central extends StatefulWidget {
  final AnaliticaController controller;

  const Central({super.key, required this.controller});

  @override
  _CentralState createState() => _CentralState();
}

class _CentralState extends State<Central> {
  @override
  void initState() {
    super.initState();
    // Inicia la simulación al crear el widget
    widget.controller.startHeartRateSimulation();
    widget.controller.startTendenciaSimulation();
    widget.controller.startRiskSimulation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return HeartRete(
                heartRateStream: widget.controller.heartRate.value);
          }),
          Obx(() => Text(
            'Datos recibidos: ${widget.controller.dataBt.value}',
            style: const TextStyle(fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          )),
          Tendencia(controller: widget.controller),
          Widgetprediccion(controller: widget.controller),
          // Cambia el texto según el estado de activate
        ],
      ),
    );
  }
}

class Tendencia extends StatelessWidget {
  final AnaliticaController controller;

  const Tendencia({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 312),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.59, -0.80),
          end: Alignment(-0.59, 0.8),
          colors: [Colors.white, Color(0xFFBBE4EE)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Graph(controller: controller),
          Tip(controller: controller),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  final AnaliticaController controller;

  const Graph({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 240),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 40),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Tendencia de ritmo cardiaco',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2E2E30),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Oct 3 del 2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2E2E30),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeartRateChart1()
        ],
      ),
    );
  }
}

class Tip extends StatelessWidget {
  final AnaliticaController controller;

  const Tip({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: ShapeDecoration(
              color: Color(0xFFECEAF8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.86),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SvgPicture.asset(
                    'assets/images/bxs_smile.svg',
                    color: AppColors.azul,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Obx(() {
            return Expanded(
              child: Container(
                constraints: const BoxConstraints.expand(height: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        controller.tendencia1.value,
                        style: const TextStyle(
                          color: AppColors.negro,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 1),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        controller.tendencia2.value,
                        style: const TextStyle(
                          color: AppColors.negro,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class Widgetprediccion extends StatelessWidget {
  final AnaliticaController controller;

  const Widgetprediccion({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 100),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.59, -0.80),
              end: Alignment(-0.59, 0.8),
              colors: [AppColors.blanco, Color(0xFFBBE4EE)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ultima predicción',
                style: TextStyle(
                  color: Color(0xFF131313),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.30,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(
                      controller.isLowRisk.value ? 'Sin riesgo' : 'Con riesgo',
                      style: const TextStyle(
                        color: AppColors.negro,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }),
                  const SizedBox(width: 8),
                  Obx(() {
                    return Container(
                      width: 32,
                      height: 32,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: SvgPicture.asset(
                        controller.isLowRisk.value
                            ? 'assets/images/icon_positivo.svg'
                            : 'assets/images/icon_negativo.svg',
                        // Cambia el icono según el estado
                        color: controller.isLowRisk.value
                            ? AppColors.azul
                            : AppColors.rojo, // Cambia el color según el estado
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeartRete extends StatelessWidget {
  final int heartRateStream; // Cambiar a tipo int

  const HeartRete({
    super.key,
    required this.heartRateStream, // Suponiendo que tienes un Stream de tasas de corazón
  });

  @override
  Widget build(BuildContext context) {
    // Definir el color del texto basado en la frecuencia cardíaca
    Color ColorIco;
    if (heartRateStream >= 90) {
      ColorIco =
          AppColors.rojo; // Color rojo si la frecuencia cardíaca es mayor a 100
    } else if (heartRateStream < 60) {
      ColorIco = Colors
          .orange; // Color naranja si la frecuencia cardíaca es menor a 60
    } else {
      ColorIco = AppColors.azul; // Color por defecto
    }
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 80),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.59, -0.80),
              end: Alignment(-0.59, 0.8),
              colors: [Colors.white, Color(0xFFBBE4EE)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Corazon.svg',
                    width: 50,
                    height: 47,
                    color: ColorIco,
                  ),
                ],
              ),
              Container(
                width: 110,
                height: 46,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      heartRateStream.toString(),
                      // Convertir a String para mostrar
                      style: TextStyle(
                        color: ColorIco,
                        fontSize: 39,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'bpm',
                      style: TextStyle(
                        color: ColorIco,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
