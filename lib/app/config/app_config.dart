import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Valores inyectados en build/web via --dart-define (Vercel/CI)
  static const String _apiUrlEnv =
      String.fromEnvironment('API_URL', defaultValue: '');
  static const String _apiKeyEnv =
      String.fromEnvironment('API_KEY', defaultValue: '');
  static const String _googleMapsApiKeyEnv =
      String.fromEnvironment('GOOGLE_MAPS_API_KEY', defaultValue: '');
  static const String _environmentEnv =
      String.fromEnvironment('ENVIRONMENT', defaultValue: '');

  /// URL base de la API
  static String get apiBaseUrl {
    if (_apiUrlEnv.isNotEmpty) return _apiUrlEnv;
    final envValue = dotenv.maybeGet('API_BASE_URL');
    if (envValue != null && envValue.isNotEmpty) return envValue;
    return 'https://api.kibo.aventiscali.com';
  }

  /// API Key para autenticación
  static String get apiKey {
    if (_apiKeyEnv.isNotEmpty) return _apiKeyEnv;
    final envValue = dotenv.maybeGet('API_KEY');
    if (envValue != null && envValue.isNotEmpty) return envValue;
    return 'local-placeholder-api-key-000000000000000000000000';
  }

  /// API Key de Google Maps
  static String get googleMapsApiKey {
    if (_googleMapsApiKeyEnv.isNotEmpty) return _googleMapsApiKeyEnv;
    final envValue = dotenv.maybeGet('GOOGLE_MAPS_API_KEY');
    if (envValue != null && envValue.isNotEmpty) return envValue;
    return 'local-placeholder-google-maps-api-key-xxxxxxxxxxxx';
  }

  /// Entorno de ejecución
  static String get environment {
    if (_environmentEnv.isNotEmpty) return _environmentEnv;
    final envValue = dotenv.maybeGet('ENVIRONMENT');
    if (envValue != null && envValue.isNotEmpty) return envValue;
    return 'development';
  }

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
