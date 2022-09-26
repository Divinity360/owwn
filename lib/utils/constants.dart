class AppConstants {
  AppConstants._();

  /// API constants

  // URLS
  static const String baseUrl = 'https://ccoding.owwn.com/hermes';
  static const String apiKey = 'owwn-challenge-22bbdk';
  static const String authUrl = '$baseUrl/auth';
  static const String refreshUrl = '$baseUrl/refresh';
  static const String usersUrl = '$baseUrl/users';

  // Error
  static const String defaultApiError = 'An error occurred';

  // Success
  static const String refreshTokenSuccess = 'Your session has been restored. Retry your previous action';

  /// Secure storage constants
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  /// UI Constants
  static const String userHeroTag = 'userHeroTag';
  static const int userHeroTransitionMillis = 1000;

}
