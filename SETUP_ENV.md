# Configuración de Variables de Entorno - Kibo

## 📋 Descripción

El proyecto Kibo utiliza variables de entorno para proteger datos sensibles como:
- URLs de API
- API Keys
- Credenciales de Twilio
- Claves de Google Maps

Estas variables se cargan desde un archivo `.env` que **NO debe ser subido al repositorio**.

## ⚙️ Configuración Inicial

### 1. Crear el archivo `.env`

```bash
# Copiar el archivo de ejemplo
cp .env.example .env
```

### 2. Rellenar Variables de Entorno

Edita el archivo `.env` con tus valores reales:

```env
# ============================================
# Configuración de API - Kibo
# ============================================
API_BASE_URL=https://api.kibo.aventiscali.com
API_KEY=tu_api_key_aqui

# ============================================
# Configuración de Twilio (para alertas)
# ============================================
TWILIO_ACCOUNT_SID=tu_account_sid
TWILIO_AUTH_TOKEN=tu_auth_token

# ============================================
# Configuración de Google Maps
# ============================================
GOOGLE_MAPS_API_KEY=tu_google_maps_api_key

# ============================================
# Configuración de Entorno
# ============================================
ENVIRONMENT=development
```

### 3. Dónde Obtener las Credenciales

#### 🔑 API Key de Kibo
Solicita esto al administrador del servidor backend.

#### 🔗 Credenciales de Twilio
1. Ve a [Twilio Console](https://www.twilio.com/console)
2. En el dashboard principal encontrarás:
   - **Account SID**: Visible en la parte superior
   - **Auth Token**: Visible junto al Account SID
3. Cópialos al archivo `.env`

#### 🗺️ Google Maps API Key
1. Ve a [Google Cloud Console](https://console.cloud.google.com/)
2. Crea un nuevo proyecto o selecciona uno existente
3. Habilita la API de Google Maps:
   - Ve a "APIs & Services" → "Library"
   - Busca "Maps SDK for Android" y "Maps SDK for iOS"
   - Haz clic en "Enable" para cada una
4. Ve a "Credentials" y crea una nueva API Key
5. Cópiala al archivo `.env`

## 🔐 Seguridad

### ✅ Lo que SÍ debes hacer:

- ✅ Mantener `.env` en `.gitignore` (ya está configurado)
- ✅ Usar variables desde `AppConfig` en tu código
- ✅ Compartir `.env.example` en el repositorio como plantilla
- ✅ Usar solo `AppConfig.defaultHeaders` para peticiones HTTP (incluye la API Key)

### ❌ Lo que NO debes hacer:

- ❌ No commits de `.env` al repositorio
- ❌ No hardcodear URLs, API Keys o tokens en el código
- ❌ No compartir el archivo `.env` con nadie
- ❌ No usar valores de prueba en producción

## 📝 Uso en el Código

### Ejemplos de Uso Correcto

#### Controllers

```dart
import 'package:kibo/app/config/app_config.dart';

class MiController extends GetxController {
  Future<void> miMetodo() async {
    final url = '${AppConfig.apiBaseUrl}/mi/endpoint';
    final response = await http.post(
      Uri.parse(url),
      headers: AppConfig.defaultHeaders, // Incluye API Key automáticamente
    );
  }
}
```

#### Providers

```dart
import 'package:kibo/app/config/app_config.dart';

class MiProvider extends GetConnect {
  Future<Response> getData() async {
    final url = '${AppConfig.apiBaseUrl}/get/data';
    return await get(url, headers: AppConfig.defaultHeaders);
  }
}
```

#### Acceso a Credenciales Específicas

```dart
// API Key
final apiKey = AppConfig.apiKey;

// Twilio
final accountSid = AppConfig.twilioAccountSid;
final authToken = AppConfig.twilioAuthToken;

// Google Maps
final googleMapsKey = AppConfig.googleMapsApiKey;

// Verificar entorno
if (AppConfig.isDevelopment) {
  // Código solo para desarrollo
}
```

## 🚀 Despliegue en Producción

### Variables de Entorno en Producción

En producción, debes configurar las variables en la plataforma de hosting:

#### Para Android
- **Firebase**: Usa Firebase Remote Config
- **Google Play**: Configura en la consola de Play Store

#### Para iOS
- **App Store**: Configura en App Store Connect
- **Xcode**: Usa Build Settings

#### Para Web
- Configura variables en tu hosting (Vercel, Netlify, etc.)
- Usa archivos `.env.production`

## ⚠️ Resolución de Problemas

### Error: "Failed to load .env file"

**Causa**: El archivo `.env` no existe
**Solución**: Crea el archivo usando `.env.example` como plantilla

```bash
cp .env.example .env
# Luego edita con tus valores
```

### Error: "API Key not found"

**Causa**: La API Key no está configurada en `.env`
**Solución**: 
1. Verifica que `API_KEY=` tiene un valor
2. Reinicia la app después de cambiar `.env`
3. Asegúrate de que `AppConfig` está siendo importado correctamente

### Las peticiones HTTP fallan

**Causa**: Headers incorrectos
**Solución**: Usa siempre `AppConfig.defaultHeaders` que incluye automáticamente:
- `Content-Type: application/json`
- `X-API-Key: [tu_api_key]`

## 📚 Referencias

- [Flutter Dotenv Documentation](https://pub.dev/packages/flutter_dotenv)
- [Twilio Console](https://www.twilio.com/console)
- [Google Cloud Console](https://console.cloud.google.com/)
- [Dart Environment Variables](https://dart.dev/guides/environment-declarations)

---

**Última actualización**: 28 de Diciembre de 2025
