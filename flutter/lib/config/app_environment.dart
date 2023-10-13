import 'package:envied/envied.dart';

part 'app_environment.g.dart';

// This class contains all the environment variables
@Envied(path: 'app.env', requireEnvFile: true)
abstract class AppEnvironment {
  /// Balhom API URL
  @EnviedField(varName: "BALHOM_API_URL", defaultValue: "http://localhost")
  static const String balhomApiUrl = _AppEnvironment.balhomApiUrl;

  /// Keycloak URL
  @EnviedField(varName: "KEYCLOAK_URL", defaultValue: "http://localhost")
  static const String keycloakUrl = _AppEnvironment.keycloakUrl;

  /// Keycloak Realm
  @EnviedField(varName: "KEYCLOAK_REALM", defaultValue: "balhom")
  static const String keycloakRealm = _AppEnvironment.keycloakRealm;

  /// Keycloak Client Id
  @EnviedField(varName: "KEYCLOAK_CLIENT_ID", defaultValue: "balhom")
  static const String keycloakClientId = _AppEnvironment.keycloakClientId;

  /// Currency Conversion API Url
  @EnviedField(varName: "CURRENCY_CONVERSION_API_URL")
  static const String currencyConversionApiUrl =
      _AppEnvironment.currencyConversionApiUrl;

  /// Currency Conversion API Key
  @EnviedField(varName: "CURRENCY_CONVERSION_API_KEY")
  static const String currencyConversionApiKey =
      _AppEnvironment.currencyConversionApiKey;
}
