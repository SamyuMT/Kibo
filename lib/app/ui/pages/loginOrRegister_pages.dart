import 'package:flutter/material.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kibo/app/controllers/loginOrRegister_controller.dart';

class LoginorregisterPages extends GetView<LoginorregisterController> {
  const LoginorregisterPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GetBuilder<LoginorregisterController>(
            init: LoginorregisterController(),
            builder: (controller) {
              return Form(child: Contenedor(controller: controller));
            }),
      ),
    );
  }
}

class Contenedor extends StatelessWidget {
  final LoginorregisterController controller;

  const Contenedor({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: AppColors.principal,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AlineadorKibo(),
            Inferior(controller: controller),
          ],
        ),
      ),
    );
  }
}

class Inferior extends StatelessWidget {
  final LoginorregisterController controller;

  const Inferior({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 310),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 48),
            child: const Text(
              'Bienvenido',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0.02,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Acción que deseas ejecutar al hacer clic en el botón
              controller.ingresarSesion();
            },
            style: ButtonStyle(
              // Define las restricciones del botón
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 56)),
              // Aplica el mismo estilo decorativo
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // Estilo de fondo del botón
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: const Text(
              'INICIAR SESIÓN',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0.09,
                letterSpacing: -0.30,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Acción que deseas ejecutar al hacer clic en el botón
              controller.ingresarIncribirse();
            },
            style: ButtonStyle(
              // Define el tamaño del botón
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 56)),
              // Define la forma y el borde del botón
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppColors.blanco),
                ),
              ),
              // Define el color de fondo
              backgroundColor: MaterialStateProperty.all(AppColors.blanco),
              // Aplica el comportamiento de clip
              overlayColor: MaterialStateProperty.all(AppColors.gris),
            ),
            child: const Text(
              'REGISTRARSE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.negro,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0.09,
                letterSpacing: -0.30,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 16),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Acceder con',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
              ],
            ),
          ),
          SocialMedia(iconPaths: const [
            'assets/images/google_logo.svg',
            'assets/images/facebook_log.svg',
            'assets/images/apple_logo.svg'
          ], controller: controller),
        ],
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  final List<String> iconPaths;
  final LoginorregisterController controller;

  const SocialMedia(
      {super.key, required this.iconPaths, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSocialMediaButton(
              iconPaths[0], 'Google', controller.ingresarGoogle),
          const SizedBox(width: 10),
          _buildSocialMediaButton(
              iconPaths[1], 'Facebook', controller.ingresarFacebook),
          const SizedBox(width: 10),
          _buildSocialMediaButton(
              iconPaths[2], 'Apple', controller.ingresarApple),
        ],
      ),
    );
  }

  // Método para construir un botón de red social
  Widget _buildSocialMediaButton(
      String iconPath, String platformName, Function onPressedAction) {
    return TextButton(
      onPressed: () {
        // Acción al presionar el botón
        onPressedAction(platformName);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}

class AlineadorKibo extends StatelessWidget {
  const AlineadorKibo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 400),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxKibo2(),
        ],
      ),
    );
  }
}

class BoxKibo2 extends StatelessWidget {
  const BoxKibo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 139),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'K',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 120,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          SizedBox(width: 16),
          Text(
            'I',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 120,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          SizedBox(width: 16),
          Text(
            'B',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 120,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          SizedBox(width: 16),
          Text(
            'O',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 120,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
        ],
      ),
    );
  }
}
