/// Defines the relative URLs for the API server endpoints.
class CurrencyConversionAPIContract {
  /// `GET` Returns currency types
  static const String currencyTypes = "/api/v1/currency";

  /// `GET` Returns currency conversion
  static const String currencyConversion = "/api/v1/conversion";

  /// `GET` Returns currency conversion days
  static const String currencyConversionDays = "/api/v1/conversion/days";
}
