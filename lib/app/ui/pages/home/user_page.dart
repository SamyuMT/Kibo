import 'dart:io';

import 'package:kibo/app/controllers/user_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserPage extends GetView<UserController> {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.azul,
        resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
        body: SafeArea(
          child: GetBuilder<UserController>(
              init: UserController(),
              builder: (AjusteAlarmaController) {
                return Form(
                  key: controller.formKeyAnalitica,
                  child: Contenedor(controller: controller),
                );
              }),
        ),
      );
}

class Contenedor extends StatelessWidget {
  final UserController controller;

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
  final UserController controller;

  const Central({super.key, required this.controller});

  @override
  _CentralState createState() => _CentralState();
}

class _CentralState extends State<Central> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // No es necesario llamar a updateHeartRateHistory aquí, se llama automáticamente en el timer
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Perfilsuperior(
            controller: widget.controller,
          ),
          const SizedBox(height: 16),
          Perfilinferior(
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}

class Perfilinferior extends StatelessWidget {
  final UserController controller;

  const Perfilinferior({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // Bordes redondeados asegurados
          child: Container(
            constraints: const BoxConstraints.expand(height: 250),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, 0.00),
                end: Alignment(-1, 0),
                colors: [Color(0xFFECE9E6), AppColors.blanco],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Modulestest(
                  id: 'Nombre',
                  etiqueta: controller.userName,
                ),
                Modulestest(
                  id: 'Apellido',
                  etiqueta: controller.userLastName,
                ),
                Modulestest(
                  id: 'Número de celular',
                  etiqueta: controller.userNumber,
                ),
                Modulestest(
                  id: 'Correo electrónico',
                  etiqueta: controller.userEmail,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Modulestest extends StatelessWidget {
  final String id;
  final String etiqueta;

  const Modulestest({super.key, required this.id, required this.etiqueta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 62.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.50,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id,
                style: const TextStyle(
                  color: Color(0xFF006BFF),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                etiqueta,
                style: const TextStyle(
                  color: AppColors.negro,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Perfilsuperior extends StatelessWidget {
  final UserController controller;

  const Perfilsuperior({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 243),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFECE9E6), AppColors.blanco],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            border: Border(
              top: BorderSide(color: AppColors.negro, width: 2.0),
              // Solo borde superior
              // Los demás bordes se pueden dejar sin definir
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide.none,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Editar(
                controller: controller,
              ),
              const SizedBox(height: 16),
              EditarText(
                controller: controller,
              ),
              const SizedBox(height: 16),
              EditarIco(controller: controller),
            ],
          ),
        ),
      ],
    );
  }
}

class Editar extends StatelessWidget {
  final UserController controller;

  const Editar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // Muestra un cuadro de diálogo para editar
              showDialog(
                context: context,
                builder: (context) {
                  String newNickName = controller.userNickName;
                  String newLastName = controller.userLastName;
                  String newName = controller.userName;
                  String newNumber = controller.userNumber;
                  String newEmail = controller.userEmail;

                  return AlertDialog(
                    title: const Text(
                      'Editar Información',
                      style: TextStyle(
                        color: AppColors.negro,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) {
                            newNickName = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Nick Name',
                            labelStyle: TextStyle(
                              color: AppColors.negro,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller: TextEditingController(
                              text: controller.userNickName),
                        ),
                        TextField(
                          onChanged: (value) {
                            newName = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(
                              color: AppColors.negro,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller:
                              TextEditingController(text: controller.userName),
                        ),
                        TextField(
                          onChanged: (value) {
                            newName = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Apellido',
                            labelStyle: TextStyle(
                              color: AppColors.negro,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller:
                          TextEditingController(text: controller.userLastName),
                        ),

                        TextField(
                          onChanged: (value) {
                            newNumber = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Número celular',
                            labelStyle: TextStyle(
                              color: AppColors.negro,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller: TextEditingController(
                              text: controller.userNumber),
                        ),
                        TextField(
                          onChanged: (value) {
                            newEmail = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Correo Electrónico',
                            labelStyle: TextStyle(
                              color: AppColors.negro,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller:
                              TextEditingController(text: controller.userEmail),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          controller.updateUser(newName,newLastName, newEmail, newNickName,
                              newNumber);
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: AppColors.negro,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: AppColors.negro,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: SvgPicture.asset('assets/images/Editar.svg',
                width: 24, height: 24, color: AppColors.negro),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class EditarText extends StatelessWidget {
  final UserController controller;

  const EditarText({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Obtén el controlador de usuario
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 48),
          padding: const EdgeInsets.symmetric(horizontal: 48),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.userNickName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.negro,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                controller.userRol,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.negro,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
