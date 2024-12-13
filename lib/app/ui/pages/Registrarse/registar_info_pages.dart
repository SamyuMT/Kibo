import 'package:flutter_svg/svg.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/registrar_info_controller.dart';

class RegistarInfoPages extends GetView<RegistrarInfoController> {
  const RegistarInfoPages({super.key}); // Clave global del formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
      body: SafeArea(
        child: GetBuilder<RegistrarInfoController>(
            init: RegistrarInfoController(),
            builder: (controller) {
              return Form(
                key: controller.formKeyRegistrarseInfo,
                child: Contendor(controller: controller),
              );
            }),
      ),
    );
  }
}

class Contendor extends StatelessWidget {
  final RegistrarInfoController controller; // Controlador recibido

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
            children: [Arriba(controller: controller),
          const SizedBox(
            height: 16),
            Overlay(controller: controller)],
          ),
        ),
      ),
    );
  }
}


class Arriba extends StatelessWidget {
  final RegistrarInfoController controller; // Controlador recibido

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
  final RegistrarInfoController controller; // Controlador recibido

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
  final RegistrarInfoController controller; // Controlador recibido

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
          Bienvenido(),
          SizedBox(width: 8), // Ahora el espacio es horizontal
          Cardiology(),
        ],
      ),
    );
  }
}

class Bienvenido extends StatelessWidget {
  const Bienvenido({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 290, // Ancho máximo
        height: 96,
        child: const Text(
          'Ya casi terminamos',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.blanco,
            fontSize: 46,
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
  final RegistrarInfoController controller;

  const Overlay({
    final key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        constraints: const BoxConstraints.expand(height: 506),
        padding: const EdgeInsets.only(top: 8),
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
          child: Column(
            children: [
              const Text(
                'Llena el siguiente formulario.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8,),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Test(controller: controller),
                  ),
                ),
              )
            ],
          ),
        ),
    ]);
  }
}


class Test extends StatelessWidget {
  final RegistrarInfoController controller;

  const Test({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Titulo(
                  text: 'Información Personal',
                ),
                CustoTextField(
                  labelText: 'Nombres',
                  controller: controller.nombreText,
                ),
                CustoTextField(
                  labelText: 'Apellidos',
                  controller: controller.apellidoText,
                ),
                CustoTextField(
                  labelText: 'Nick Name',
                  controller: controller.nickName,
                ),

                CustoTextField(
                  labelText: 'Genero',
                  controller: controller.generoText,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.generosList,
                ),
                CustoTextField(
                  labelText: 'Rol de trabajo',
                  controller: controller.rol,
                ),
                CustoTextField(
                  labelText: 'Tipo de documento',
                  controller: controller.tipoDocumentoText,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.tipoDeDocumentos,
                ),
                CustoTextField(
                  labelText: 'Número de documento',
                  controller: controller.numeroDocumentoText,
                ),
                CustoTextField(
                  labelText: 'Departamento',
                  controller: controller.departamentoText,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.departamentosColombia,
                ),
                CustoTextField(
                  labelText: 'Municipio o ciudad capital',
                  controller: controller.municipioOCiudadText,
                ),
                CustoTextField(
                  labelText: 'Barrio',
                  controller: controller.barrioText,
                ),
                CustoTextField(
                  labelText: 'Tipo de calle',
                  controller: controller.tipoDeCalleText,
                  isDropdown: true,
                  // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.tiposDeVias,
                ),
                Obx(() {
                  return CustoTextField(
                    labelText: controller.tipoDeCalleText.value,
                    controller: controller.calleText,
                  );
                }),
                CustoTextField(
                  labelText: 'Número',
                  controller: controller.numeroText,
                ),
                const Titulo(
                  text: 'Contacto de Emergencia',
                ),
                CustoTextField(
                  labelText: 'Nombres',
                  controller: controller.nombreTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Apellidos',
                  controller: controller.apellidoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Genero',
                  controller: controller.generoTextEmergencia,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.generosList,
                ),
                CustoTextField(
                  labelText: 'Tipo de documento',
                  controller: controller.tipoDocumentoTextEmergencia,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.tipoDeDocumentos,
                ),
                CustoTextField(
                  labelText: 'Número de documento',
                  controller: controller.numeroDocumentoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Número de celular',
                  controller: controller.numeroCelularTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Parentesco',
                  controller: controller.parentescoEmergencia,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.parentescos,
                ),
                CustoTextField(
                  labelText: 'Departamento',
                  controller: controller.departamentoTextEmergencia,
                  isDropdown: true,
                  // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.departamentosColombia,
                ),
                CustoTextField(
                  labelText: 'Municipio o ciudad capital',
                  controller: controller.municipioOCiudadTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Barrio',
                  controller: controller.barrioTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Tipo de calle',
                  controller: controller.tipoDeCalleTextEmergencia,
                  isDropdown: true,
                  // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.tiposDeVias,
                ),
                Obx(() {
                  return CustoTextField(
                    labelText: controller.tipoDeCalleTextEmergencia.value,
                    controller: controller.calleTextEmergencia,
                  );
                }),
                CustoTextField(
                  labelText: 'Número',
                  controller: controller.numeroTextEmergencia,
                ),
                const Titulo(
                  text: 'Información de Atención Médica',
                ),
                CustoTextField(
                  labelText: 'Aseguradora/EPS',
                  controller: controller.aseguradoraTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Tipo de vinculacion',
                  controller: controller.tipoVinculacionTextEmergencia,
                  isDropdown: true,
                  // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.tipoVinculacion,
                ),
                CustoTextField(
                  labelText: 'Nombres del Médico Tratante',
                  controller: controller.nombreMedicoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Apellidos del Médico Tratante',
                  controller: controller.apellidoMedicoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Especialidad del Médico Tratante',
                  controller: controller.especialidadMedicoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Correo del Médico',
                  controller: controller.correoTextEmergencia,
                ),
                CustoTextField(
                  labelText: 'Institución del residente',
                  controller: controller.hospitalResidenteTextEmergencia,
                ),
                BotonGuardar(
                  controller: controller,
                ),
              ],
    );
  }
}

class Titulo extends StatelessWidget {
  final String text;

  const Titulo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 0),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.gris,
              border: Border(
                bottom: BorderSide(
                  width: 0.50,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.negro,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustoTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final RxString controller; // Controlador para manejar el texto
  final bool isDropdown; // Bool para controlar el tipo de campo
  final List<String>? dropdownItems; // Opciones para el DropdownButtonFormField

  const CustoTextField({
    super.key,
    required this.labelText,
    required this.controller, // Se requiere un controlador para inicializar el texto
    this.hintText = '',
    this.isDropdown = false, // Predeterminado a TextFormField
    this.dropdownItems, // Opcional: solo es necesario si es Dropdown
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 26),
          padding: const EdgeInsets.only(left: 16, top: 4),
          child: Text(
            labelText,
            style: const TextStyle(
              color: AppColors.negro,
              fontSize: 16,
              fontFamily: 'Poppins', // Aplicamos la fuente Poppins
              fontWeight: FontWeight.w500, // Peso de 500
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints.expand(height: 42),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.50,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          child: isDropdown ? _buildDropdown() : _buildTextField(),
        ),
      ],
    );
  }

  // Widget para el DropdownButtonFormField
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: controller.value.isNotEmpty ? controller.value : null,
      // Asignar valor inicial si existe
      onChanged: (value) {
        if (value != null) {
          controller.value = value; // Actualizar el valor observable
        }
      },
      items: dropdownItems?.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none, // Sin borde
      ),
      style: const TextStyle(
        fontFamily: 'Poppins', // Fuente Poppins para Dropdown
        fontSize: 16,
        fontWeight: FontWeight.w500, // Peso 500
        color: AppColors.grisdesactivado, // Color del texto
      ),
      isExpanded: true,
      menuMaxHeight: 200.0, // Esta es la propiedad correcta para Flutter 2.0+
      // Evitar que el dropdown se corte
    );
  }

  // Widget para el TextFormField
  Widget _buildTextField() {
    return TextFormField(
      initialValue: controller.value, // Asignar el valor inicial
      onChanged: (value) {
        controller.value = value; // Actualizar el valor observable
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none, // Sin borde
      ),
      style: const TextStyle(
        fontFamily: 'Poppins', // Fuente Poppins para TextField
        fontSize: 16,
        fontWeight: FontWeight.w500, // Peso 500
        color: AppColors.grisdesactivado, // Color del texto
      ),
    );
  }
}

class BotonGuardar extends StatelessWidget {
  final RegistrarInfoController controller;

  const BotonGuardar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 96),
      padding: const EdgeInsets.all(16),
      child: TextButton(
        onPressed: () {
          controller.guardarDatos();
          print('Datos guardados'); // O cualquier otra acción que desees
        },
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor:
          WidgetStateProperty.all(AppColors.principal.colors.first),
          shadowColor: WidgetStateProperty.all(const Color(0xCCCBD6FF)),
          elevation: WidgetStateProperty.all(10),
        ),
        child: const Text(
          'Crear Usuario',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
