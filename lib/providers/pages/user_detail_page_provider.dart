import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/providers/pages/user_list_page_provider.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:provider/provider.dart';

class UserDetailPageProvider extends ChangeNotifier {
  bool _loading = false;

  /// Selected user
  Users? _user;

  /// User name textEditingController
  TextEditingController nameController = TextEditingController();

  /// User email textEditingController
  TextEditingController emailController = TextEditingController();

  /// Check if user's name has been updated
  bool _isUserNameEdited = false;

  /// Check if user's email has been updated
  bool _isUserEmailEdited = false;

  bool get loading => _loading;

  bool get isUserNameEdited => _isUserNameEdited;

  bool get isUserEmailEdited => _isUserEmailEdited;

  /// Check if any user field has been updated
  bool get isAnyUserFieldEdited => _isUserEmailEdited || _isUserNameEdited;

  Users? get user => _user;

  UserDetailPageProvider(Users userData) {
    user = userData;
  }

  final _userListProvider = Provider.of<UserListPageProvider>(
    navigatorKey.currentContext!,
    listen: false,
  );

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set isUserNameEdited(bool value) {
    _isUserNameEdited = value;
    notifyListeners();
  }

  set isUserEmailEdited(bool value) {
    _isUserEmailEdited = value;
    notifyListeners();
  }

  set user(Users? value) {
    _user = value;
    nameController.text = _user!.name!;
    emailController.text = _user!.email ?? '';
    notifyListeners();
  }

  /// Update user name was edited
  void onNameChanged(String text) => isUserNameEdited = true;

  /// Update user email was edited
  void onEmailChanged(String text) => isUserEmailEdited = true;

  /// Retrieve user model index from user list
  int _getUserIndex(List<Users> userList) =>
      userList.indexWhere((element) => element.id == user!.id);

  /// Update user list with updated fields
  void onSaveTap(BuildContext context) {
    final pageIndexedUserList =
        _userListProvider.nestedUsersList[user!.parentIndex!];
    if (isUserNameEdited) {
      pageIndexedUserList[_getUserIndex(pageIndexedUserList)] =
          user!.copyWith(name: nameController.text);
    }
    if (isUserEmailEdited) {
      pageIndexedUserList[_getUserIndex(pageIndexedUserList)] =
          user!.copyWith(email: emailController.text);
    }
    context.pop();
  }
}
