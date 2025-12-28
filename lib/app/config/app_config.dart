import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  /// URL base de la API
  static String get apiBaseUrl =>
      dotenv.get('API_BASE_URL', fallback: 'https://api.kibo.aventiscali.com');

  /// API Key para autenticación
  static String get apiKey => dotenv.get('API_KEY', fallback: '');

  /// API Key de Google Maps
  static String get googleMapsApiKey =>
      dotenv.get('GOOGLE_MAPS_API_KEY', fallback: '');

  /// Entorno de ejecución
  static String get environment =>
      dotenv.get('ENVIRONMENT', fallback: 'development');

  /// Verificar si está en modo desarrollo
  static bool get isDevelopment => environment == 'development';

  /// Verificar si está en modo producción
  static bool get isProduction => environment == 'production';

  /// Headers por defecto para las peticiones HTTP
  static Map<String, String> get defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-API-Key': apiKey,
      };
}
