import 'package:kibo/app/controllers/login_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key}); // Clave global del formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
      body: SafeArea(
        child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Form(
                key: controller.formKeyLogin,
                child: Contendor(controller: controller),
              );
            }),
      ),
    );
  }
}

class Contendor extends StatelessWidget {
  final LoginController controller; // Controlador recibido

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Arriba(controller: controller),
              const SizedBox(
                height: 88,
              ),
              Overlay(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class Arriba extends StatelessWidget {
  final LoginController controller; // Controlador recibido

  const Arriba({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 240),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Superior(controller: controller),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 128,
            child: TextoCentral(),
          ),
        ],
      ),
    );
  }
}

class Superior extends StatelessWidget {
  final LoginController controller; // Controlador recibido

  const Superior({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(height: 96),
        padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
        child: ArrowForward(controller: controller));
  }
}

class ArrowForward extends StatelessWidget {
  final LoginController controller; // Controlador recibido

  const ArrowForward({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            controller.backLoginRegister();
          },
          // Llama a la acción cuando se presiona el botón
          icon: SvgPicture.asset(
            'assets/images/arrow_forward.svg', // Ruta de tu SVG
            width: 48,
            height: 48,
            color: AppColors.blanco, // Puedes cambiar el color si es necesario
          ),
          iconSize: 48,
          // Tamaño del ícono
          padding: EdgeInsets.zero,
          // Elimina el padding extra
          constraints:
              const BoxConstraints(), // Ajusta para que no tenga límites adicionales
        ),
      ],
    );
  }
}

class TextoCentral extends StatelessWidget {
  const TextoCentral({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HolaDeNuevo(),
          SizedBox(width: 48), // Ahora el espacio es horizontal
          Cardiology(),
        ],
      ),
    );
  }
}

class HolaDeNuevo extends StatelessWidget {
  const HolaDeNuevo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 208, // Ancho máximo
        height: 96,
        child: const Text(
          '¡Hola de nuevo!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.blanco,
            fontSize: 48,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            height: 1.0, // Espaciado entre líneas
          ),
          maxLines: 2, // Establece el número máximo de líneas
          overflow: TextOverflow.ellipsis, // Agrega elipsis si se desborda
        ),
      ),
    );
  }
}

class Cardiology extends StatelessWidget {
  const Cardiology({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 4.67, vertical: 7),
      child: SvgPicture.asset(
        'assets/images/corazon_icon.svg', // Ruta del archivo SVG
        width: 56,
        height: 56,
        fit: BoxFit.contain, // Ajusta cómo se muestra el SVG
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  final LoginController controller;

  const Overlay({
    final key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        constraints: const BoxConstraints.expand(height: 442),
        padding: const EdgeInsets.only(top: 32, bottom: 8, left: 8, right: 8),
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: AppColors.blanco,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                bottomLeft: Radius.circular(48),
                bottomRight: Radius.circular(48)),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x47000000),
              blurRadius: 10.40,
              offset: Offset(0, 0),
              spreadRadius: 8,
            )
          ],
        ),
        child: Inferior(controller: controller),
      ),
    ]);
  }
}

class Inferior extends StatelessWidget {
  final LoginController controller;

  const Inferior({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 399),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Intro(controller: controller),
          const SizedBox(
            height: 24,
          ),
          BotonInferior(controller: controller),
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  final LoginController controller;

  const Intro({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 194),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Obx(() => CustoTextField(
                isAlert: controller.isUserAlert.value,
                isPassword: false,
                hintText: 'Correo o Numero',
                controller: controller.UserController
                  ..addListener(() {
                    // Llama a checkButtonState cuando el texto cambie
                    controller.checkButtonState();
                  }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo no puede estar vacío';
                  }
                  return null;
                },
              )),
          const SizedBox(
            height: 24,
          ),
          Obx(() => CustoTextField(
                isAlert: controller.isPasswordAlert.value,
                isPassword: true,
                hintText: 'Contraseña',
                controller: controller.passwordController
                  ..addListener(() {
                    // Llama a checkButtonState cuando el texto cambie
                    controller.checkButtonState();
                  }),
                // Controlador del campo de texto
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo no puede estar vacío';
                  }
                  return null;
                },
              )),
          const SizedBox(
            height: 24,
          ),
          const OlvidasteTuContrasena(),
        ],
      ),
    );
  }
}

class CustoTextField extends StatelessWidget {
  final bool
      isAlert; // Si es true, muestra el borde en rojo y un ícono de alerta
  final bool isPassword; // Si es true, será un campo de contraseña
  final String hintText; // Texto personalizado del marcador de posición
  final double iconSize; // Tamaño del ícono
  final TextEditingController controller; // Añadir controlador de texto
  final String? Function(String?)? validator; // Validador personalizado

  const CustoTextField({
    super.key,
    required this.isAlert,
    required this.isPassword,
    required this.hintText,
    this.iconSize = 24.0,
    required this.controller, // Controlador requerido
    this.validator, // Validador opcional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 62),
      child: TextFormField(
        controller: controller,
        // Usa el controlador pasado como argumento
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          labelText: hintText,
          labelStyle: const TextStyle(
            color: AppColors.grisdesactivado,
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 1.5,
            letterSpacing: -0.30,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: isAlert ? AppColors.rojo : AppColors.azul,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: isAlert ? AppColors.rojo : AppColors.azul,
              width: 2.0,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: AppColors.rojo,
              width: 2.0,
            ),
          ),
          hintText: isAlert ? '' : hintText,
          suffixIcon: isAlert
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/images/pulse_alert.svg',
                    width: iconSize,
                    height: iconSize,
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            maxHeight: iconSize + 36,
            maxWidth: iconSize + 36,
          ),
        ),
        style: const TextStyle(
          color: AppColors.grisdesactivado,
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          height: 1.5,
          letterSpacing: -0.30,
        ),
        obscureText: isPassword,
        // Oculta el texto si es contraseña
        validator: validator, // Añade el validador personalizado
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final bool
      isAlert; // Si es true, muestra el borde en rojo y un ícono de alerta
  final bool isPassword; // Si es true, será un campo de contraseña
  final String hintText; // Texto personalizado del marcador de posición

  const CustomTextField({
    super.key,
    required this.isAlert,
    required this.isPassword,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 62),
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: isAlert ? AppColors.rojo : AppColors.azul,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText, // Usa el texto personalizado
                border: InputBorder.none, // Sin bordes adicionales
              ),
              style: const TextStyle(
                color: AppColors.grisdesactivado,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 1.5,
                // Altura de línea adecuada
                letterSpacing: -0.30,
              ),
              keyboardType:
                  isPassword ? TextInputType.text : TextInputType.text,
              // Tipo de teclado según la entrada
              obscureText: isPassword, // Oculta el texto si es contraseña
            ),
          ),
          if (isAlert)
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/images/pulse_alert.svg', // Ruta del archivo SVG
                fit: BoxFit.contain, // Ajusta cómo se muestra el SVG
              ),
            ),
        ],
      ),
    );
  }
}

class OlvidasteTuContrasena extends StatelessWidget {
  const OlvidasteTuContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 21),
      child: const Text(
        '¿Olvidaste tu contraseña?',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF006BFF),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }
}

class BotonInferior extends StatelessWidget {
  final LoginController controller;

  const BotonInferior({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 145),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BotonIngresar(controller: controller),
          const SizedBox(
            height: 24,
          ),
          const Incribirse(),
        ],
      ),
    );
  }
}

class BotonIngresar extends StatelessWidget {
  final LoginController controller;

  const BotonIngresar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        constraints: const BoxConstraints.expand(height: 62),
        child: TextButton(
          onPressed: controller.isButtonEnabled.value
              ? () {
                  controller
                      .validateCredentials(); // Llama a la validación de credenciales
                  if (!controller.isPasswordAlert.value &&
                      !controller.isUserAlert.value) {
                    print(
                        'La contaseña es: ${controller.passwordController.text}');
                    print(
                        'El correo es: ${controller.UserController.text}'); // Acción cuando se presione el botón
                  }
                }
              : null,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
                controller.isButtonEnabled.value
                    ? AppColors.principal.colors.first
                    : Colors.grey),
            shadowColor: WidgetStateProperty.all(const Color(0xCCCBD6FF)),
            elevation: WidgetStateProperty.all(10),
          ),
          child: const Text(
            'Ingresar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ),
    );
  }
}

class Incribirse extends StatelessWidget {
  const Incribirse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 58),
      width: double.infinity,
      height: 58,
      padding: const EdgeInsets.all(8),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              '¿No tienes cuenta?',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.grisdesactivado,
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
              'Inscribirse',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.grisdesactivado,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}