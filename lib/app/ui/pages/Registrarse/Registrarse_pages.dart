import 'package:kibo/app/controllers/login_controller.dart';
import 'package:kibo/app/controllers/registrarse_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrarsePages extends GetView<RegistrarseController> {
  const RegistrarsePages({super.key}); // Clave global del formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
      body: SafeArea(
        child: GetBuilder<RegistrarseController>(
            init: RegistrarseController(),
            builder: (controller) {
              return Form(
                key: controller.formKeyRegistrarse,
                child: Contendor(controller: controller),
              );
            }),
      ),
    );
  }
}

class Contendor extends StatelessWidget {
  final RegistrarseController controller; // Controlador recibido

  const Contendor({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(gradient: AppColors.principal),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ),
    );
  }
}
