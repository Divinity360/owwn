import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/models/auth_response.dart';
import 'package:owwn_coding_challenge/services/api/api_service.dart';
import 'package:owwn_coding_challenge/services/storage/storage_service.dart';
import 'package:owwn_coding_challenge/utils/extensions.dart';
import 'package:owwn_coding_challenge/utils/helpers.dart';
import 'package:owwn_coding_challenge/utils/router.dart';

class LoginPageProvider extends ChangeNotifier {
  bool _loading = false;
  TextEditingController emailController = TextEditingController();

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// Request and save auth tokens to secure storage
  Future onLoginBtnTapped(BuildContext context) async {
    if (emailController.text.isValidEmail){
      loading = true;
      final router = GoRouter.of(context);
      final response = await ApiService.requestAuthTokens(emailController.text);
      if (response.data != null) {
        final authResponse = response.data as AuthResponse;
        await AppSecureStorage.saveAccessToken(authResponse.accessToken!);
        await AppSecureStorage.saveRefreshToken(authResponse.refreshToken!);
        router.push(AppRouter.users);
      } else {
        AppHelpers.toastMessage('Invalid login credentials');
      }
      emailController.clear();
      loading = false;
    } else {
      AppHelpers.toastMessage('Please input a valid email');
    }


  }
}
