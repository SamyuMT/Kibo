import 'package:kibo/app/controllers/home_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.azul,
        resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
        body: SafeArea(
          child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (homeController) {
                return Form(
                  key: homeController.formKeyHome,
                  child: Contenedor(controller: homeController),
                );
              }),
        ),
      );
}

class Contenedor extends StatelessWidget {
  final HomeController controller;

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
            ), // Parte inferior fija
          ],
        ),
      ),
    );
  }
}

class Central extends StatelessWidget {
  final HomeController controller;

  const Central({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextoSuperior(),
          // Usamos Obx para observar los cambios en el valor de activate
          Obx(() {
            return Bluetooth(
              controller: controller,
              activate: controller.activate.value,
            );
          }),

          // Cambia el texto según el estado de activate
          Container(
            constraints: const BoxConstraints.expand(height: 48),
            child: Obx(() {
              return Text(
                controller.activate.value
                    ? 'Tu dispositivo está conectado'
                    : 'Tu dispositivo está desactivado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: controller.activate.value
                      ? AppColors.blanco
                      : AppColors.negro,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              );
            }),
          ),

          // El widget Corazon también puede observar activate si es necesario
          Obx(() {
            return Corazon(
              activate: controller.activate.value,
            );
          }),
        ],
      ),
    );
  }
}

class Corazon extends StatelessWidget {
  final bool activate;

  const Corazon({super.key, required this.activate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 172,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: ShapeDecoration(
        color: AppColors.blanco,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.66),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xA3000000),
            blurRadius: 14.83,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/Corazon.svg',
            width: 148,
            height: 136,
            color: activate ? AppColors.azul : AppColors.negro,
          ),
        ], // Cierra correctamente el 'children'
      ),
    );
  }
}

class TextoSuperior extends StatelessWidget {
  const TextoSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 89),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 58),
                child: const Text(
                  'Buscar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.negro,
                    fontSize: 70,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.01,
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints.expand(height: 24),
                child: const Text(
                  'Dispositivo bluetooth',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.negro,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                      letterSpacing: -0.30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Bluetooth extends StatelessWidget {
  final HomeController controller;
  final bool activate;

  const Bluetooth(
      {super.key, required this.controller, required this.activate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 144,
      decoration: ShapeDecoration(
        color: AppColors.blanco,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        shadows: [
          BoxShadow(
            color: activate ? AppColors.azul : AppColors.negro,
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            decoration: BoxDecoration(
              color: activate ? AppColors.azul : AppColors.blanco,
              // Color azul
              shape: BoxShape.circle, // Forma circular
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 69, maxHeight: 113),
            child: IconButton(
              onPressed: () {
                controller.activateBluetooth();
                print('Usuario');
              },
              icon: SvgPicture.asset(
                'assets/images/bluetooth.svg',
                width: 69,
                height: 113,
                color: activate ? AppColors.azul : AppColors.negro,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            decoration: BoxDecoration(
              color: activate ? AppColors.azul : AppColors.blanco,
              // Color azul
              shape: BoxShape.circle, // Forma circular
            ),
          ),
        ],
      ),
    );
  }
}
