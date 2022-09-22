import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/models/auth_response.dart';
import 'package:owwn_coding_challenge/providers/auth/auth_provider.dart';
import 'package:owwn_coding_challenge/services/api_service.dart';
import 'package:owwn_coding_challenge/utils/helpers.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:provider/provider.dart';

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
    loading = true;
    final router = GoRouter.of(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final response = await ApiService.requestAuthTokens(emailController.text);
    if (response.data != null) {
      final AuthResponse authResponse = response.data as AuthResponse;
      await authProvider.saveAccessToken(authResponse.accessToken!);
      await authProvider.saveRefreshToken(authResponse.refreshToken!);
      router.go(AppRouter.start);
    } else {
      AppHelpers.toastMessage('Invalid login credentials');
    }
    emailController.clear();
    loading = false;

  }
}
