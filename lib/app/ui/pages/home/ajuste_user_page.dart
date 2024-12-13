import 'package:kibo/app/controllers/ajustes_user_controller.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AjusteUserPage extends GetView<AjustesUserController> {
  const AjusteUserPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.blanco,
        resizeToAvoidBottomInset: true, // Permitir que el cuerpo se ajuste
        body: SafeArea(
          child: GetBuilder<AjustesUserController>(
              init: AjustesUserController(),
              builder: (AjustesUserController) {
                return Form(
                  key: AjustesUserController.formKeyAnalitica,
                  child: Contenedor(controller: AjustesUserController),
                );
              }),
        ),
      );
}

class Contenedor extends StatelessWidget {
  final AjustesUserController controller;

  const Contenedor({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
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
  final AjustesUserController controller;

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
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.negro, width: 2.0),
          // Solo borde superior
          // Los demás bordes se pueden dejar sin definir
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide(color: AppColors.negro, width: 2.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Test(
              controller: widget.controller,
            )
          ],
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  final AjustesUserController controller;

  const Test({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Titulo(
                  text: 'Información Personal',
                ),
                CustoTextField(
                  labelText: 'Genero',
                  controller: controller.generoText,
                  isDropdown: true, // Esto mostrará un DropdownButtonFormField
                  dropdownItems: controller.generosList,
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
                //BotonGuardar(
                 // controller: controller,
                //),
              ],
            ),
          ),
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
  final AjustesUserController controller;

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
          'Guardar',
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
