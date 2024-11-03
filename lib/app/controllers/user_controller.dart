import 'dart:io';

import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserController extends GetxController {
  var selectedImage = Rxn<File>(); // Ahora es reactiva

  final TextEditingController textControllerUser =
      TextEditingController(); // Controlador para User
  final TextEditingController textControllerEmail =
      TextEditingController(); // Controlador para Email

  get formKeyAnalitica => null;
  String userNickName = 'SamMT';
  String userName = 'Jereminth Muñoz';
  String userEmail = 'JemyCraft12@hotmail.com';
  String userNumber = '3052264620';
  String userCity = 'Yumbo';

  // Método para actualizar los datos
  void updateUser(
      String name, String email, String nick, String number, String city) {
    userName = name;
    userEmail = email;
    userNickName = nick;
    userCity = city;
    userNumber = number;
    update(); // Notifica a la UI que se actualizó el estado
  }

  // Método para actualizar la imagen
  void updateImage(File? image) {
    selectedImage.value = image; // Actualiza el valor reactivo
  }
}

class EditarIco extends StatelessWidget {
  final UserController controller; // Controlador para la imagen

  const EditarIco({super.key, required this.controller});

  // Función para seleccionar imagen desde la galería
  Future<void> _pickImage(BuildContext context) async {
    // Solicitar permisos de la galería
    final status = await Permission.photos.request();

    if (status.isGranted) {
      // Si el permiso es concedido, abrir la galería
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Actualiza la imagen en el controlador
        controller.updateImage(File(pickedFile.path));
      } else {
        print('No se seleccionó ninguna imagen');
      }
    } else if (status.isDenied) {
      print('Permiso denegado. No se puede acceder a la galería.');
    } else if (status.isPermanentlyDenied) {
      print(
          'Permiso denegado permanentemente. Dirige al usuario a los ajustes.');
      await openAppSettings(); // Abre los ajustes del dispositivo
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context), // Llamar a la galería al hacer tap
      child: Obx(
        () {
          return Container(
            width: 105,
            height: 105,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: controller.selectedImage.value != null
                    ? FileImage(controller
                        .selectedImage.value!) // Mostrar imagen seleccionada
                    : const AssetImage("assets/images/image.jpg")
                        as ImageProvider,
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(
                side: BorderSide(
                  width: 4,
                  color: AppColors.negro,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
