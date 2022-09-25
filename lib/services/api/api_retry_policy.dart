import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:owwn_coding_challenge/models/auth_response.dart';
import 'package:owwn_coding_challenge/services/api/api_service.dart';
import 'package:owwn_coding_challenge/services/storage/storage_service.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';
import 'package:owwn_coding_challenge/utils/helpers.dart';
import 'package:owwn_coding_challenge/utils/router.dart';

/// API Service retry policy
class ExpiredTokenRetryPolicy extends RetryPolicy {
  ///Maximum number of retry attempts
  @override
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      await handleUnAuthorizedServerResponse(response);
      return true;
    }
    return false;
  }

}

/// Request refresh token during retry attempt and navigate to login screen if expired
Future<void> handleUnAuthorizedServerResponse(ResponseData response) async {
  if (response.url != AppConstants.refreshToken) {
    final response = await ApiService.refreshAuthTokens();
    final authResponse = response.data as AuthResponse;
    AppSecureStorage.saveAccessToken(authResponse.accessToken!);
    AppSecureStorage.saveRefreshToken(authResponse.refreshToken!);
    AppHelpers.toastMessage(AppConstants.refreshTokenSuccess);
  } else {
    navigatorKey.currentContext!.go(AppRouter.login);
  }
}