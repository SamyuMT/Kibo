# 🏥 Kibo - Aplicación de Monitoreo de Salud

Kibo es una aplicación Flutter de vanguardia diseñada para monitorear y analizar datos de salud en tiempo real. La aplicación se conecta con dispositivos Bluetooth, recopila datos biométricos y proporciona análisis detallados con visualización de gráficos interactivos.

## 📋 Tabla de Contenidos

- [Características Principales](#características-principales)
- [Requisitos Previos](#requisitos-previos)
- [Instalación y Configuración](#instalación-y-configuración)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Guía de Uso](#guía-de-uso)
- [Configuración de Permisos](#configuración-de-permisos)
- [API y Servicios](#api-y-servicios)
- [Solución de Problemas](#solución-de-problemas)

---

## ✨ Características Principales

### 🔐 Autenticación
- Registro e inicio de sesión de usuarios
- Gestión de credenciales segura
- Persistencia de sesión con GetStorage

### 📊 Análisis de Datos
- Monitoreo en tiempo real de frecuencia cardíaca (BPM)
- Gráficos interactivos usando Syncfusion Charts
- Visualización de tendencias y patrones
- Análisis de alertas de salud

### 📱 Conectividad Bluetooth
- Conexión con dispositivos wearables
- Lectura de datos biométricos en tiempo real
- Gestión automática de conexiones

### 📍 Localización
- Integración con Google Maps
- Seguimiento de ubicación en tiempo real
- Solicitud de permisos de ubicación

### 🎵 Notificaciones y Alertas
- Notificaciones push locales
- Alertas de anomalías en datos de salud
- Sonidos de alerta personalizados

### 👤 Perfil de Usuario
- Gestión de información personal
- Datos médicos y de emergencia
- Información de contactos de emergencia
- Información de doctor asignado

---

## 🔧 Requisitos Previos

Antes de clonar y ejecutar el proyecto, asegúrate de tener instalado:

### Software Requerido

```bash
# Verificar versiones instaladas
flutter --version
dart --version
java -version
```

**Versiones Mínimas Recomendadas:**

| Software | Versión Mínima | Versión Recomendada |
|----------|-----------------|-------------------|
| Flutter | 3.5.3 | 3.35.5 o superior |
| Dart | 3.5.3 | 3.9.0 o superior |
| Java | 17 | 17 o superior |
| Android SDK | API 33 | API 34+ |
| Xcode (iOS) | 15.0 | 15.0+ |
| Kotlin | 2.1.0 | 2.1.0 o superior |
| Android Gradle Plugin | 8.6.0 | 8.6.0 o superior |

### Dependencias del Sistema

**macOS/Linux:**
```bash
# Instalar o actualizar Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verificar dependencias
flutter doctor -v
```

**Android:**
- Android Studio 2024+
- Android SDK Build-Tools 33.0.1+
- Android Platform SDK 33+
- JDK 17 o superior

**iOS:**
- Xcode 15.0 o superior
- iOS Deployment Target: 11.0 o superior
- CocoaPods

---

## 📥 Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone https://github.com/SamyuMT/Kibo.git
cd Kibo
```

### 2. Configurar Variables de Entorno

Es **OBLIGATORIO** configurar las variables de entorno antes de ejecutar la aplicación.

```bash
# Copiar el archivo de ejemplo
cp .env.example .env

# Editar el archivo .env con tus credenciales reales
# IMPORTANTE: Nunca commits .env al repositorio
nano .env
```

Variables requeridas:
- `API_BASE_URL`: URL del servidor API
- `API_KEY`: Clave de autenticación de la API
- `TWILIO_ACCOUNT_SID`: ID de cuenta de Twilio (para alertas)
- `TWILIO_AUTH_TOKEN`: Token de Twilio
- `GOOGLE_MAPS_API_KEY`: Clave de Google Maps

👉 **[Ver guía completa de configuración](./ENV_SETUP.md)**

### 3. Configurar Entorno Flutter

```bash
# Actualizar Flutter a la versión más reciente
flutter upgrade

# Verificar configuración del proyecto
flutter doctor -v
flutter pub get
```

### 4. Configurar Gradle (Android)

El proyecto está configurado con:
- **Android Gradle Plugin (AGP)**: 8.6.0
- **Kotlin**: 2.1.0
- **Java Compatibility**: VERSION_17
- **Core Library Desugaring**: Habilitado

Si encuentras errores de Gradle, ejecuta:

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### 5. Configurar iOS (si es necesario)

```bash
cd ios
pod install --repo-update
cd ..
```

### 6. Generar Código

El proyecto utiliza `json_serializable` para modelos. Generar archivos automáticamente:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

O en modo watch (generación automática en cambios):

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 7. Configurar Variables de Entorno

Crear archivo `local.properties` en la raíz de Android:

```properties
flutter.sdk=<ruta-a-flutter>
flutter.buildMode=debug
flutter.minSdkVersion=21
flutter.targetSdkVersion=34
```

---

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada de la app
├── app/
│   ├── app.dart                       # Configuración de la app (deprecated)
│   ├── bindlings/                     # Inyección de dependencias (GetX)
│   │   ├── login_bindling.dart
│   │   ├── home_bindling.dart
│   │   ├── navbar_bindling.dart
│   │   └── ...
│   ├── controllers/                   # Lógica de negocio (GetX Controllers)
│   │   ├── login_controller.dart
│   │   ├── home_controller.dart       # Gestión de Bluetooth
│   │   ├── analitica_controller.dart  # Análisis de datos
│   │   ├── registrarse_controller.dart
│   │   └── ...
│   ├── data/
│   │   ├── model/                     # Modelos de datos (JSON serializable)
│   │   │   ├── user/
│   │   │   ├── credential/
│   │   │   ├── medical_user/
│   │   │   ├── emergency_user/
│   │   │   ├── doctor_user/
│   │   │   └── info_user/
│   │   ├── provider/                  # Llamadas a API
│   │   │   ├── login_provider.dart
│   │   │   ├── home_provider.dart
│   │   │   ├── analitica_provider.dart
│   │   │   └── ...
│   │   └── repository/                # Capa de repositorio
│   │       ├── login_repository.dart
│   │       └── ...
│   ├── middleware/                    # Middleware personalizado
│   │   └── auth_middleware.dart       # Validación de autenticación
│   ├── routes/                        # Configuración de rutas
│   │   ├── routes.dart                # Definición de rutas
│   │   └── pages.dart                 # Mapeo de rutas a páginas
│   ├── ui/
│   │   ├── pages/                     # Pantallas de la aplicación
│   │   │   ├── login/
│   │   │   ├── loginOrRegister_pages.dart
│   │   │   ├── start01_pages.dart
│   │   │   ├── navbar.dart            # Navegación principal
│   │   │   ├── Registrarse/           # Registro de usuario
│   │   │   └── home/
│   │   │       ├── home_pages.dart
│   │   │       ├── analitica_pages.dart    # Gráficos de análisis
│   │   │       ├── ajuste_alarma_page.dart
│   │   │       ├── user_page.dart          # Perfil de usuario
│   │   │       └── ...
│   │   ├── themes/                    # Temas de la app
│   │   │   ├── light_theme.dart
│   │   │   └── dark_theme.dart
│   │   └── utils/                     # Utilidades de UI
│   │       └── style_utils.dart
│   └── view/
│       ├── home.dart
│       └── splash.dart
├── assets/                            # Recursos estáticos
│   ├── images/                        # Imágenes
│   ├── sounds/                        # Archivos de audio
│   ├── fonts/
│   │   └── Poppins-*.ttf              # Fuente personalizada
│   ├── icon/                          # Icono de la app
│   └── vector/
│       ├── vector.csv                 # Datos de vectores
│       └── full_tiempo_2760.00.csv
└── test/                              # Tests unitarios

```

---

## 🛠 Tecnologías Utilizadas

### Framework y Lenguaje
- **Flutter 3.35.5+** - Framework UI multiplataforma
- **Dart 3.9.0+** - Lenguaje de programación

### Gestión de Estado y Navegación
- **GetX 4.6.6** - Gestión de estado, inyección de dependencias y navegación
- **GetStorage 2.1.1** - Almacenamiento local persistente

### Componentes UI
- **Material Design 3** - Componentes de interfaz
- **EasyLoading 3.0.5** - Indicadores de carga
- **PageTransition 2.1.0** - Transiciones entre pantallas
- **CustomNavigationBar 0.8.2** - Barra de navegación personalizada
- **AutoSizeText 3.0.0** - Texto autoajustable

### Datos y Serialización
- **JSON Serializable 6.8.0** - Generación automática de serialización JSON
- **BuildRunner 2.4.13** - Generador de código
- **CSV 5.0.2** - Lectura/escritura de archivos CSV
- **Intl 0.18.0** - Internacionalización y formato de fechas

### Gráficos y Mapas
- **Syncfusion Flutter Charts 27.1.53** - Gráficos interactivos avanzados
- **Flutter Map 4.0.0** - Mapas interactivos
- **GoogleMaps Flutter 2.2.0** - Integración con Google Maps
- **LatLong2 0.8.1** - Utilidades de coordenadas

### Conectividad y Ubicación
- **FlutterBluePlus 1.33.6** - Conexión Bluetooth LE
- **Location 7.0.1** - Servicios de ubicación
- **Geolocator 13.0.1** - Geolocalización avanzada
- **PermissionHandler 11.3.1** - Gestión de permisos
- **HTTP 0.13.6** - Cliente HTTP para API REST

### Multimedia
- **AudioPlayers 5.2.0** - Reproducción de audio
- **ImagePicker 1.1.2** - Selección de imágenes
- **FlutterSVG 2.0.0** - Renderización de SVG
- **FlutterLauncherIcons 0.10.0** - Generación de iconos

### Notificaciones
- **FlutterLocalNotifications 17.2.3** - Notificaciones locales push

### Otros
- **AppSettings 5.1.1** - Acceso a configuración del dispositivo
- **AndroidIntentPlus 5.2.0** - Intents de Android personalizados

---

## 📱 Guía de Uso

### Iniciar Sesión

1. **Pantalla de Bienvenida (StartOne)**
   - Primera pantalla que ve el usuario
   - Acceso a Login o Registro

2. **Registro de Nuevo Usuario**
   - Completar información personal
   - Crear credenciales
   - Cargar datos médicos y de emergencia
   - Confirmar registro

3. **Inicio de Sesión**
   - Ingresar credenciales
   - Acceso a dashboard principal

### Dashboard Principal (Navbar)

La aplicación tiene 4 secciones principales accesibles desde la barra de navegación:

1. **Home** (📱)
   - Vista principal de dispositivos Bluetooth conectados
   - Monitoreo en tiempo real de datos biométricos
   - Conexión/desconexión de wearables

2. **Analítica** (📊)
   - Gráficos de frecuencia cardíaca (BPM)
   - Análisis de tendencias
   - Visualización de datos históricos
   - Alertas de anomalías

3. **Ajustes de Alarma** (⏰)
   - Configuración de alertas personalizadas
   - Umbrales de BPM máximo y mínimo
   - Sonidos de notificación

4. **Perfil de Usuario** (👤)
   - Información personal
   - Datos médicos
   - Contactos de emergencia
   - Información del doctor

---

## 🔒 Configuración de Permisos

### Android (AndroidManifest.xml)

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
```

### iOS (Info.plist)

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Necesitamos tu ubicación mientras usas la app.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Necesitamos acceso a tus fotos para guardar y seleccionar imágenes.</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>Acceso a dispositivos Bluetooth cercanos requerido.</string>
<key>NSCameraUsageDescription</key>
<string>Acceso a la cámara para tomar fotos o grabar videos.</string>
```

---

## 🔌 API y Servicios

### Endpoints Principales

La aplicación se conecta con un backend para:

- **Autenticación**: Login y registro
- **Sincronización de datos**: Cargar datos de salud al servidor
- **Análisis remoto**: Obtener análisis procesados
- **Alertas**: Enviar alertas de anomalías

### Modelos de Datos

#### Usuario Base
```dart
User {
  String id,
  String nombre,
  String apellido,
  String nickname,
  String email,
  String? imgUrl
}
```

#### Datos Médicos
```dart
MedicalUser {
  String idDoctor,
  String tipoVinculo,
  String imgUrl
}
```

#### Datos de Emergencia
```dart
EmergencyUser {
  String nombre,
  String apellido,
  String tipoDocumento,
  String numeroDocumento,
  String numeroTelefono,
  String ciudad,
  String direccion
}
```

---

## 🐛 Solución de Problemas

### Error: "JDK 17 or higher is required"

**Solución:**
```bash
# Verificar Java instalado
java -version

# Si no está instalado, instalar JDK 17+
# macOS: brew install java@17
# Linux: sudo apt-get install openjdk-17-jdk
```

### Error: "Android Gradle Plugin version X is lower than Flutter's minimum"

**Solución:** El proyecto está configurado con AGP 8.6.0 y Kotlin 2.1.0. Si aún hay problemas:

```bash
# Actualizar Gradle
cd android
./gradlew wrapper --gradle-version=8.10.0
cd ..
```

### Error: "Core library desugaring is required"

**Solución:** Ya está habilitado en `android/app/build.gradle`. Si persiste:

```gradle
// En compileOptions:
coreLibraryDesugaringEnabled = true

// En dependencies:
coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.0.4'
```

### Bluetooth no funciona

**Verificar:**
1. Permisos de Bluetooth concedidos en el dispositivo
2. El dispositivo tiene Bluetooth habilitado
3. El wearable está en modo de emparejamiento

### Gráficos no cargan datos

**Solución:**
1. Verificar que hay datos disponibles en el servidor
2. Revisar conexión a Internet
3. Regenerar modelos: `flutter pub run build_runner build`

---

## 🚀 Comandos Útiles

```bash
# Limpiar proyecto
flutter clean

# Obtener dependencias
flutter pub get

# Generar código
flutter pub run build_runner build --delete-conflicting-outputs

# Analizar código
flutter analyze

# Formatear código
dart format .

# Ejecutar en debug
flutter run

# Ejecutar en release
flutter run --release

# Ejecutar en dispositivo específico
flutter devices                    # Listar dispositivos
flutter run -d <device-id>        # Ejecutar en dispositivo

# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release
```

---

## 📧 Contacto y Soporte

Para reportar bugs o solicitar features:
- GitHub Issues: [Kibo Issues](https://github.com/SamyuMT/Kibo/issues)
- Desarrollador: SamyuMT
- Celular: +57 3024946753

---

## 📄 Licencia

Este proyecto es propietario de Aventis. Todos los derechos reservados.

---

**Última actualización:** 28 de Diciembre de 2025
