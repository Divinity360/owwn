import 'package:flutter/material.dart';

class UserListPageProvider extends ChangeNotifier {
  bool _loading = false;
  TextEditingController emailController = TextEditingController();

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future init() async{

  }

  /// Request and save auth tokens to secure storage
  Future onLoginBtnTapped(BuildContext context) async {


  }
}
