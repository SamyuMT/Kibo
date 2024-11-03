import 'package:kibo/app/controllers/start01_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start01Page extends StatelessWidget {
  const Start01Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos Get.put para instanciar el controlador y hacerlo accesible
    final Start01Controller controller = Get.put(Start01Controller());
    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
      body: SafeArea(
        child: Contendor(controller: controller),
      ),
    );
  }
}

class Contendor extends StatelessWidget {
  final Start01Controller controller; // Controlador recibido

  const Contendor({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 96),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: AppColors.principal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [boxKibo1(controller: controller)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class boxKibo1 extends StatelessWidget {
  final Start01Controller controller; // Controlador recibido

  const boxKibo1({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Aquí puedes añadir la lógica que ocurre cuando se presiona el botón
            print('Botón KIBO presionado');
            controller.tagBottom();
          },
          borderRadius: BorderRadius.circular(54.76),
          splashColor: Colors.grey.withOpacity(0.3), // Efecto de splash
          child: Container(
            width: 232,
            height: 206,
            padding:
                const EdgeInsets.symmetric(horizontal: 18.82, vertical: 54.76),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(54.76),
              ),
            ),
            child: const Row(
              children: [
                Kibo(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Kibo extends StatelessWidget {
  const Kibo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 193.36,
          height: 96,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 53,
                child: Text(
                  'K',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kiboStart,
                ),
              ),
              SizedBox(
                width: 22,
                child: Text(
                  'I',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kiboStart,
                ),
              ),
              SizedBox(
                width: 53,
                child: Text(
                  'B',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kiboStart,
                ),
              ),
              SizedBox(
                width: 65,
                child: Text(
                  'O',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kiboStart,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
