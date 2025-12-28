import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kibo/app/config/app_config.dart';

void main() {
  setUpAll(() async {
    // Load environment variables for testing
    await dotenv.load(fileName: '.env');
  });

  group('AppConfig Tests', () {
    test('apiBaseUrl should load from .env', () {
      expect(AppConfig.apiBaseUrl, isNotEmpty);
      expect(AppConfig.apiBaseUrl, contains('https://'));
    });

    test('apiKey should load from .env', () {
      expect(AppConfig.apiKey, isNotEmpty);
      expect(AppConfig.apiKey.length, greaterThan(30));
    });

    test('defaultHeaders should include X-API-Key', () {
      final headers = AppConfig.defaultHeaders;
      expect(headers.containsKey('X-API-Key'), isTrue);
      expect(headers.containsKey('Content-Type'), isTrue);
      expect(headers.containsKey('Accept'), isTrue);
    });

    test('defaultHeaders X-API-Key should match apiKey', () {
      final headers = AppConfig.defaultHeaders;
      expect(headers['X-API-Key'], equals(AppConfig.apiKey));
    });

    test('googleMapsApiKey should load from .env', () {
      expect(AppConfig.googleMapsApiKey, isNotEmpty);
    });

    test('environment should be properly set', () {
      expect(AppConfig.isDevelopment || AppConfig.isProduction, isTrue);
    });
  });
}
