import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/models/user_list_response.dart';
import 'package:owwn_coding_challenge/services/api/api_service.dart';

class UserListPageProvider extends ChangeNotifier {
  bool _loading = false;

  /// Nested list of [Users] based on pagination
  List<List<Users>> _nestedUsersList = [];

  /// [Users] list page index
  int pageIndex = 1;

  bool get loading => _loading;

  List<List<Users>> get nestedUsersList => _nestedUsersList;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set nestedUsersList(List<List<Users>> value) {
    _nestedUsersList = value;
    notifyListeners();
  }

  Future init() async {
    loading = true;
    nestedUsersList.clear();
    log('nestedUsersList $nestedUsersList');
    final response = await ApiService.requestUserList(pageIndex);
    final userListResponse = response.data as UserListResponse;
    nestedUsersList.add(userListResponse.users!);
    loading = false;
  }

  /// Request and save auth tokens to secure storage
  Future onLoginBtnTapped(BuildContext context) async {}
}
