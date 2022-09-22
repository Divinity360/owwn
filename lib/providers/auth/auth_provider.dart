import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';

/// Application authentication provider
class AuthProvider extends ChangeNotifier {
  /// Create secure storage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Read access token from [FlutterSecureStorage]
  Future<String?> readAccessToken() async {
    final accessToken = await _storage.read(key: AppConstants.accessToken);
    return accessToken;
  }

  /// Read refresh token from [FlutterSecureStorage]
  Future<String?> readRefreshToken() async {
    final refreshToken = await _storage.read(key: AppConstants.refreshToken);
    return refreshToken;
  }

  /// Write access token to [FlutterSecureStorage]
  Future saveAccessToken(String accessToken) async {
    await _storage.write(key: AppConstants.accessToken, value: accessToken);
  }

  /// Write refresh token to [FlutterSecureStorage]
  Future saveRefreshToken(String refreshToken) async {
    await _storage.write(key: AppConstants.refreshToken, value: refreshToken);
  }
}
