import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/providers/auth/auth_provider.dart';
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

  ///
  Future onLoginBtnTapped(BuildContext context) async {
    loading = true;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final router = GoRouter.of(context);
    final refreshToken = await authProvider.readRefreshToken();
    if (refreshToken != null) {
    } else {
      router.go(AppRouter.login);
    }
  }
}
