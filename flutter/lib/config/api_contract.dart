/// Defines the relative URLs for the API server endpoints.
class APIContract {
  /*
   * ============ Version ============ *
   */

  /// `GET` Returns last version
  static const String version = "/api/v1/version";

  /*
   * ============ Account ============ *
   */

  /// `POST` Account creation
  static const String accountCreation = "/api/v1/account";

  /// `GET`, `PUT`, `PATCH`, `DEL` Account
  static const String accountProfile = "/api/v1/account/profile";

  /*
   * ============ Auth ============ *
   */

  /// `POST` Access tokens
  static const String authAccess = "/api/v1/auth/access";

  /// `POST` Refresh tokens
  static const String authRefresh = "/api/v1/auth/refresh";

  /// `POST` Logout session
  static const String authLogout = "/api/v1/auth/logout";

  /// [POST] Auth email verification
  static const String authEmailVerify = "/api/v1/auth/send-verify-email";

  /// [POST] Auth password reset
  static const String authPasswordReset = "/api/v1/auth/password-reset";

  /*
   * ============ Annual balance ============ *
   */

  /// [GET] Returns annual balance
  static const String annualBalance = "/api/v1/annual_balance";

  /*
   * ============ Monthly balance ============ *
   */

  /// [GET] Returns monthly balance
  static const String monthlyBalance = "/api/v1/monthly_balance";

  /*
   * ============ Currency ============ *
   */

  /// [GET] Returns currency conversion
  static const String currencyConversion = "/api/v1/coin/exchange";

  /// [GET] Returns currency type
  static const String currencyType = "/api/v1/coin/type";

  /*
   * ============ Revenue ============ *
   */

  /// [GET], [PUT], [PATCH], [DEL] Revenue info
  static const String revenue = "/api/v1/revenue";

  /// [GET] Returns revenue type
  static const String revenueType = "/api/v1/revenue/type";

  /// [GET] Returns revenue years
  static const String revenueYears = "/api/v1/revenue/years";

  /*
   * ============ Expense ============ *
   */

  /// [GET], [PUT], [PATCH], [DEL] Expense info
  static const String expense = "/api/v1/expense";

  /// [GET] Returns expense type
  static const String expenseType = "/api/v1/expense/type";

  /// [GET] Returns expense years
  static const String expenseYears = "/api/v1/expense/years";
}
