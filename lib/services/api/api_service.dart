import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:owwn_coding_challenge/models/auth_response.dart';
import 'package:owwn_coding_challenge/models/base_response.dart';
import 'package:owwn_coding_challenge/models/user_list_response.dart';
import 'package:owwn_coding_challenge/services/api/api_interceptor.dart';
import 'package:owwn_coding_challenge/services/api/api_retry_policy.dart';
import 'package:owwn_coding_challenge/services/storage/storage_service.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';
import 'package:http/http.dart' as http;

/// Application network service
class ApiService {
  ApiService._();

  /// Http client with interceptor and retry policy
  static final httpClient = InterceptedClient.build(
    interceptors: [ApiInterceptor()],
    retryPolicy: ExpiredTokenRetryPolicy(),
  );

  /// Fetch user access token and refresh token
  static Future<BaseResponse> requestAuthTokens(String email) async {
    final body = {'email': email};
    final response = await httpClient.post(
      Uri.parse(AppConstants.authUrl),
      body: jsonEncode(body),
    );
    if (response.body.isEmpty) {
      return const BaseResponse(error: AppConstants.defaultApiError);
    }
    final Map decodedRes = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      return BaseResponse(data: AuthResponse.fromJson(decodedRes));
    }
    return BaseResponse(error: decodedRes['message'] as String);
  }

  /// Refresh Authorization Tokens
  static Future<BaseResponse> refreshAuthTokens() async {
    final refreshToken = await AppSecureStorage.readRefreshToken();
    final body = {'refresh_token': refreshToken};
    final header = {
      'Content-type': 'application/json',
      'X-API-KEY': AppConstants.apiKey
    };
    final response = await http.post(
      Uri.parse(AppConstants.refreshUrl),
      body: jsonEncode(body),
      headers: header,
    );
    log(response.toString());
    final decodedRes = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      return BaseResponse(data: AuthResponse.fromJson(decodedRes));
    }
    return BaseResponse(error: decodedRes['message'] as String);
  }

  /// Request list of users
  static Future<BaseResponse> requestUserList(int pageIndex) async {
    final queryParams = {'limit': 10, 'page': pageIndex};
    final response = await httpClient.get(
      Uri.parse(AppConstants.usersUrl),
      params: queryParams,
    );
    final decodedRes = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      return BaseResponse(data: UserListResponse.fromJson(decodedRes));
    }
    return BaseResponse(error: decodedRes['message'] as String);
  }
}
