import 'package:envied/envied.dart';

part 'app_env_vars.g.dart';

// This class contains all the environment variables
@Envied(path: 'app.env', requireEnvFile: true)
abstract class AppEnvVars {
  /// Balhom API URL
  @EnviedField(varName: "BALHOM_API_URL", defaultValue: "http://localhost")
  static const String balhomApiUrl = _AppEnvVars.balhomApiUrl;

  /// Currency Conversion API Url
  @EnviedField(varName: "CURRENCY_CONVERSION_API_URL")
  static const String currencyConversionApiUrl =
      _AppEnvVars.currencyConversionApiUrl;

  /// Currency Conversion API Key
  @EnviedField(varName: "CURRENCY_CONVERSION_API_KEY", obfuscate: true)
  static String currencyConversionApiKey =
      _AppEnvVars.currencyConversionApiKey;
}
