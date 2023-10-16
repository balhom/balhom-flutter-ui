/// Defines the relative URLs for the API server endpoints.
class BalhomAPIContract {
  /*
   * ============ Version ============ *
   */

  /// `GET` Returns last version
  static const String version = "/api/v2/version";

  /*
   * ============ Auth ============ *
   */

  /// `POST` Access tokens
  static const String authAccess = "/api/v2/auth/access";

  /// `POST` Refresh tokens
  static const String authRefresh = "/api/v2/auth/refresh";

  /// `POST` Logout session
  static const String authLogout = "/api/v2/auth/logout";

  /// `POST` Auth email verification
  static const String authEmailVerify = "/api/v2/auth/send-verify-email";

  /// `POST` Auth password reset
  static const String authPasswordReset = "/api/v2/auth/password-reset";

  /*
   * ============ Account ============ *
   */

  /// `POST` Account creation
  static const String accountCreation = "/api/v2/account";

  /// `GET`, `PUT`, `PATCH`, `DEL` Account
  static const String accountProfile = "/api/v2/account/profile";

  /// `PUT` Account Image
  static const String accountImage = "/api/v2/account/image";

  /*
   * ============ Balance ============ *
   */

  /// `GET` Returns annual balance
  static const String annualBalance = "/api/v2/annual-balance";

  /// `GET` Returns monthly balance
  static const String monthlyBalance = "/api/v2/monthly-balance";

  /// `GET`, `PUT`, `PATCH`, `DEL` Balance info
  static const String balance = "/api/v2/balance";

  /// `GET` Returns Balance years
  static const String balanceYears = "/api/v2/balance/years";

  /// `GET` Returns Balance type
  static const String balanceType = "/api/v2/balance/type";

  /// `GET` Returns Balance Summary
  static const String balanceSummary = "/api/v2/balance/summary";

  /*
   * ============ Statistics ============ *
   */

  /// `GET` Statistics info
  static const String statistics = "/api/v2/statistics";
}
