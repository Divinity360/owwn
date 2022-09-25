import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/models/user_list_response.dart';
import 'package:owwn_coding_challenge/services/api/api_service.dart';
import 'package:owwn_coding_challenge/utils/helpers.dart';

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

  /// Request initial set [Users] lists
  Future init() async {
    nestedUsersList.clear();
    pageIndex = 1;
    await fetchUsersList();
  }

  /// Fetch users list and update [_nestedUsersList]
  Future fetchUsersList() async {
    loading = true;
    final response = await ApiService.requestUserList(pageIndex);
    if (response.data != null) {
      final userListResponse = response.data as UserListResponse;
      if (userListResponse.users!.isNotEmpty) {
        nestedUsersList.add(userListResponse.users!);
        pageIndex += 1;
      } else {
        AppHelpers.toastMessage('All users have been fetched!');
      }
      loading = false;
    }

    log('=======LOADING===== $loading');
  }
}
