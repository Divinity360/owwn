import 'package:http_interceptor/http_interceptor.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/models/auth_response.dart';
import 'package:owwn_coding_challenge/services/api_service.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:owwn_coding_challenge/utils/storage.dart';

/// API Service interceptor class
class ApiInterceptor implements InterceptorContract {
  /// Intercept Api request with headers
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final requestUrl = data.url;
      data.headers.clear();
      data.headers['Content-type'] = 'application/json';
      data.headers['X-API-KEY'] = AppConstants.apiKey;

      if (requestUrl != AppConstants.authUrl) {
        final accessToken = await AppSecureStorage.readRefreshToken();
        if (accessToken != null) {
          data.headers['authorization'] = 'Bearer $accessToken';
        }
      }
    } catch (e) {
      print(e);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

/// API Service retry policy
class ExpiredTokenRetryPolicy extends RetryPolicy {
  ///Maximum number of retry attempts
  @override
  int maxRetryAttempts = 2;

  /// Request refresh token during retry attempt and navigate to login screen if expired
  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      if (response.url != AppConstants.refreshToken) {
        final response = await ApiService.refreshAuthTokens();
        final authResponse = response.data as AuthResponse;
        AppSecureStorage.saveAccessToken(authResponse.accessToken!);
        AppSecureStorage.saveRefreshToken(authResponse.refreshToken!);
      } else {
        navigatorKey.currentContext!.go(AppRouter.login);
      }
      return true;
    }
    return false;
  }
}
