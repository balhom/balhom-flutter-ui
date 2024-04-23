// This class contains all the environment variables
class AppEnvVars {
  /// Balhom API URL
  static const String balhomApiUrl = String.fromEnvironment("BALHOM_API_URL");

  /// Currency Conversion API Url
  static const String currencyConversionApiUrl =
      String.fromEnvironment("CURRENCY_CONVERSION_API_URL");

  /// Currency Conversion API Key
  static const String currencyConversionApiKey =
      String.fromEnvironment("CURRENCY_CONVERSION_API_KEY");
}
