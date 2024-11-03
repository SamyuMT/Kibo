import 'package:kibo/app/controllers/ajuste_alarma_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Alias para google_maps_flutter

class AjusteAlarmaPage extends GetView<AjusteAlarmaController> {
  const AjusteAlarmaPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.azul,
        resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
        body: SafeArea(
          child: GetBuilder<AjusteAlarmaController>(
              init: AjusteAlarmaController(),
              builder: (AjusteAlarmaController) {
                return Form(
                  key: AjusteAlarmaController.formKeyAnalitica,
                  child: Contenedor(controller: AjusteAlarmaController),
                );
              }),
        ),
      );
}

class Contenedor extends StatelessWidget {
  final AjusteAlarmaController controller;

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
  final AjusteAlarmaController controller;

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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Map(controller: widget.controller),
            const SizedBox(
              height: 8,
            ),
            Overlay(
              controller: widget.controller,
            ),
          ],
        ),
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  final AjusteAlarmaController controller;

  const Overlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 374),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Titulo(),
            Obx(() {
              return SizedBox(
                child: Column(
                  children: [
                    ModuleTestAlarm(
                      controller: controller,
                      useStateOn: true,
                      id: 'Alarma',
                      etiqueta: 'Todas las clases',
                      state: controller.isAlarmaOn.value,
                    ),
                    ModuleTestAlarm(
                      controller: controller,
                      useStateOn: false,
                      id: 'V',
                      etiqueta: 'Etiqueta V',
                      state: controller.isV.value,
                    ),
                    ModuleTestAlarm(
                      controller: controller,
                      useStateOn: false,
                      id: '!',
                      etiqueta: 'Etiqueta !',
                      state: controller.isAle.value,
                    ),
                    ModuleTestAlarm(
                      controller: controller,
                      useStateOn: false,
                      id: 'F',
                      etiqueta: 'Etiqueta F',
                      state: controller.isF.value,
                    ),
                    ModuleTestAlarm(
                      controller: controller,
                      useStateOn: false,
                      id: 'f',
                      etiqueta: 'Etiqueta f',
                      state: controller.isf.value,
                    ),
                    CustomTextField(
                      controller: controller,
                      hintText: 'Escribe tu alerta...',
                      maxLines: 5, // Establecer el número máximo de líneas
                      isScrollable:
                          true, // Permitir el desplazamiento en el campo de texto
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 8),
            BotonPrueba(controller: controller)
          ],
        ),
      ),
    );
  }
}

class BotonPrueba extends StatelessWidget {
  final AjusteAlarmaController controller;

  const BotonPrueba({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      constraints: const BoxConstraints.expand(height: 72),
      child: TextButton(
        onPressed: () {
          // Acción al presionar el botón
          controller.toggleBottomPrueba();
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              AppColors.principal.colors.first // Color cuando está habilitado
              ),
          shadowColor: MaterialStateProperty.all(const Color(0xCCCBD6FF)),
          elevation: MaterialStateProperty.all(10),
        ),
        child: const Text(
          'Realizar Prueba',
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  final AjusteAlarmaController controller;
  final String hintText; // Texto que se muestra cuando el campo está vacío
  final int maxLines; // Número máximo de líneas para el campo de texto
  final bool isScrollable; // Permitir el desplazamiento si es necesario

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 88),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        color: AppColors.blanco,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TextField(
          controller: controller.TextController,
          maxLines: isScrollable ? null : maxLines,
          // Si isScrollable es verdadero, permite múltiples líneas
          decoration: InputDecoration(
            border: InputBorder.none, // Sin borde
            hintText: hintText, // Texto de sugerencia
            hintStyle: const TextStyle(
                color: AppColors.negro,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400), // Color del texto de sugerencia
          ),
          style: const TextStyle(
              color: AppColors.negro,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400), // Personaliza el tamaño del texto
          // Puedes agregar más estilos o propiedades aquí
        ),
      ),
    );
  }
}

class ModuleTestAlarm extends StatelessWidget {
  final AjusteAlarmaController controller;
  final bool useStateOn; // Agregar propiedad para definir el tipo de widget
  final String id;
  final String etiqueta;
  final bool state;

  const ModuleTestAlarm({
    super.key,
    required this.controller,
    required this.useStateOn,
    required this.id,
    required this.etiqueta,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 48),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        color: AppColors.blanco,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            width: 216,
            child: Text(
              etiqueta,
              style: const TextStyle(
                color: AppColors.negro,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Condicional para determinar qué widget mostrar
          if (useStateOn)
            StateOn(
              state: state,
              controller: controller,
              id: id, // Identificador único para cada switch
            )
          else
            CustomCheckbox(
              isChecked: state,
              isDisabled: controller.isAlarmaOn.value,
              // Cambiar a true si se desea deshabilitar
              width: 24,
              height: 24,
              onChanged: (value) {
                // Llama a un método en el controlador para manejar el cambio de estado
                controller.toggleState(id, value); // Pasa el id y el valor
              },
            ),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final bool isChecked; // Estado del Checkbox
  final bool isDisabled; // Si el Checkbox está deshabilitado
  final double width; // Ancho del Checkbox
  final double height; // Alto del Checkbox
  final ValueChanged<bool>
      onChanged; // Callback para manejar el cambio de estado

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.isDisabled,
    required this.width,
    required this.height,
    required this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    Color checkboxColor;
    Color checkboxColorBack;

    // Determinar el color del checkbox según su estado
    if (widget.isDisabled) {
      checkboxColor = widget.isChecked
          ? const Color(0xFFD2D2D2)
          : Colors.grey; // Disabled con check o sin check
      checkboxColorBack = widget.isChecked
          ? const Color(0xFFD2D2D2)
          : AppColors.blanco; // Disabled con check o sin check
    } else {
      checkboxColor = widget.isChecked ? Colors.blue : Color(0xFFBABDC2);
      checkboxColorBack =
          widget.isChecked ? Colors.blue : AppColors.blanco; // Activo
    }

    return GestureDetector(
      onTap: widget.isDisabled
          ? null // No permitir cambios si está deshabilitado
          : () {
              widget.onChanged(
                  !widget.isChecked); // Cambia el estado al hacer clic
            },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          // Fondo azul si está checked
          border: Border.all(color: checkboxColor, width: 2),
          color: checkboxColorBack,
          // Borde del Checkbox
          // Borde del Checkbox
          borderRadius: BorderRadius.circular(4), // Esquinas redondeadas
        ),
        child: Center(
          child: widget.isChecked
              ? const Icon(
                  Icons.check,
                  color: AppColors.blanco,
                  size: 20,
                )
              : null,
        ),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 48),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.50,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      child: const Center(
        child: Text(
          'Configuración de alerta',
          style: TextStyle(
            color: AppColors.negro,
            fontSize: 23,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Map extends StatelessWidget {
  final AjusteAlarmaController controller;

  const Map({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 244),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgetmapa(controller: controller),
              Modulestest(
                controller: controller,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Modulestest extends StatelessWidget {
  final AjusteAlarmaController controller;

  const Modulestest({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.blanco,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xCC000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
            width: 216,
            child: Text(
              'Habilitar Ubicación',
              style: TextStyle(
                color: AppColors.negro,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Obx(() {
            return StateOn(
                state: controller.isMapOn.value,
                controller: controller,
                id: 'Map' // Identificador único para cada switch
                );
          }),
        ],
      ),
    );
  }
}

class StateOn extends StatelessWidget {
  final AjusteAlarmaController controller;
  final bool state;
  final String id; // Identificador único del switch

  const StateOn(
      {super.key,
      required this.state,
      required this.controller,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 51,
      height: 31,
      child: Stack(
        children: [
          // Fondo animado (cambia de color según el estado)
          AnimatedContainer(
            duration: const Duration(milliseconds: 125),
            decoration: BoxDecoration(
              color: state ? const Color(0xFFFF362E) : const Color(0xFFCECECE),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 51,
            height: 31,
          ),
          // Switch Cupertino
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: CupertinoSwitch(
              value: state,
              onChanged: (value) {
                controller.toggleState(id, value); // Pasa el id y el valor
              },
              trackColor: const Color(0xFFCECECE),
              // Color Off
              activeColor: const Color(0xFFFF362E),
              // Color On
              thumbColor: AppColors.blanco, // Color del thumb
            ),
          ),
        ],
      ),
    );
  }
}

class Widgetmapa extends StatelessWidget {
  final AjusteAlarmaController controller;

  const Widgetmapa({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Verifica si el mapa está activado
      if (controller.isMapOn.value) {
        // Verifica si la posición es nula antes de renderizar el mapa
        if (controller.currentPosition.value != null) {
          // Si la posición es válida, renderiza el mapa
          return Container(
            constraints: const BoxConstraints.expand(height: 200),
            decoration: ShapeDecoration(
              color: const Color(0xFFCECECE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints.expand(height: 155),
                  decoration: BoxDecoration(
                    color: AppColors.blanco,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          controller.currentPosition.value!.latitude,
                          controller.currentPosition.value!.longitude,
                        ),
                        zoom: 13,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('my_location'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: LatLng(
                            controller.currentPosition.value!.latitude,
                            controller.currentPosition.value!.longitude,
                          ),
                        ),
                      },
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController mapController) {
                        // Puedes usar el controlador aquí si es necesario
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 6.80,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Latitud: ${controller.currentPosition.value!.latitude.toStringAsFixed(6)}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.negro,
                          ),
                        ),
                        Text(
                          'Longitud: ${controller.currentPosition.value!.longitude.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.negro,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // Si no hay posición, muestra un mensaje de espera
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.blanco,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Obteniendo ubicación...',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.negro,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      } else {
        // Muestra un contenedor vacío o un mensaje si el mapa está desactivado
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.blanco,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Mapa desactivado',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: AppColors.negro,
                fontSize: 16,
              ),
            ),
          ),
        );
      }
    });
  }
}
