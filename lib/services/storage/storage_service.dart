import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';

/// Application secure storage singleton
class AppSecureStorage {
  AppSecureStorage._();

  /// Secure storage instance
  static FlutterSecureStorage? _prefsInstance;

  /// Secure storage instance getter
  static FlutterSecureStorage? get _instance =>
      _prefsInstance ??= const FlutterSecureStorage();

  /// Secure storage initialization function
  static FlutterSecureStorage? init() => _instance;

  /// Read access token from [FlutterSecureStorage]
  static Future<String?> readAccessToken() async {
    final accessToken = await _instance!.read(key: AppConstants.accessToken);
    return accessToken;
  }

  /// Read refresh token from [FlutterSecureStorage]
  static Future<String?> readRefreshToken() async {
    final refreshToken = await _instance!.read(key: AppConstants.refreshToken);
    return refreshToken;
  }

  /// Write access token to [FlutterSecureStorage]
  static Future saveAccessToken(String accessToken) async {
    await _instance!.write(key: AppConstants.accessToken, value: accessToken);
  }

  /// Write refresh token to [FlutterSecureStorage]
  static Future saveRefreshToken(String refreshToken) async {
    await _instance!.write(key: AppConstants.refreshToken, value: refreshToken);
  }

}
