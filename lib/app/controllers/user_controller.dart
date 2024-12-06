import 'dart:io';
import 'dart:typed_data';

import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/provider/image_user_provider.dart';
import 'navbar_controller.dart';

class UserController extends GetxController {
  final NavbarController navbarController = Get.find<NavbarController>();  // Instancia del NavbarController


  final UserImageScreen imageProvider = UserImageScreen(); // Instancia del proveedor

  var remoteImage = Rxn<Uint8List>(); // Imagen remota reactiva

  Future<void> fetchRemoteImage(String imageUrl) async {
    try {
      print('Cargando imagen de URL: $imageUrl');
      final imageData = await imageProvider.getImageUser(imgUrl: imageUrl);
      if (imageData != null) {
        print('hola');
        remoteImage.value = imageData; // Actualiza la imagen remota
      }
    } catch (e) {
      print('Error al cargar la imagen remota: $e');
    }
  }


  var selectedImage = Rxn<File>(); // Ahora es reactiva

  final TextEditingController textControllerUser =
      TextEditingController(); // Controlador para User
  final TextEditingController textControllerEmail =
      TextEditingController(); // Controlador para Email

  get formKeyAnalitica => null;
  String userRol = '';
  String userNickName = '';
  String userName = '';
  String userLastName = '';
  String userEmail = '';
  String userNumber = '';
  String userCity = '';

  // Método para actualizar los datos
  void updateUser(
      String name,String lastName, String email, String nick, String number) {
    userName = name;
    userLastName = lastName;
    userEmail = email;
    userNickName = nick;
    userNumber = number;
    update(); // Notifica a la UI que se actualizó el estado
  }

  // Método para actualizar la imagen
  void updateImage(File? image) {
    selectedImage.value = image; // Actualiza el valor reactivo
  }

  @override
  Future<void> onReady() async {
    final box = GetStorage();
    userName = box.read('user_name');
    userLastName = box.read('user_name_last');
    userNickName = box.read('user_nickname');
    userEmail = box.read('user_email');
    userNumber = box.read('user_number');
    userCity = box.read('user_city');
    userRol = box.read('user_rol');
    fetchRemoteImage(box.read('user_img_url'));
    update(); // Notifica los cambios
    super.onReady();
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
                    ? FileImage(controller.selectedImage.value!) // Mostrar imagen seleccionada
                    : controller.remoteImage.value != null
                        ? MemoryImage(controller.remoteImage.value!)
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
