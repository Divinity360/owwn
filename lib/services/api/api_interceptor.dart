import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:owwn_coding_challenge/services/api/api_retry_policy.dart';
import 'package:owwn_coding_challenge/services/storage/storage_service.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';


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
        final accessToken = await AppSecureStorage.readAccessToken();
        if (accessToken != null) {
          data.headers['authorization'] = 'Bearer $accessToken';
        }
      }
      log('REQUEST DATA $data');
    } catch (e) {
      print(e);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log('RESPONSE DATA ${data.toString()}');
    if (data.statusCode == 401) {
      await handleUnAuthorizedServerResponse(data);
    }
    return data;
  }
}
