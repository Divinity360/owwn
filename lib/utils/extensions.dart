import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';

/// Application extension class
extension StringExtension on String {
  String get toInitials =>
      isNotEmpty ? trim().split(' ').map((l) => l[0]).take(2).join() : '';

  bool get isValidEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}

extension UserListExtension on List<Users> {
  List<Users> get whereStatusIsActive =>
      where((user) => user.status == Status.active).toList();

  List<Users> get whereStatusIsNotActive =>
      where((user) => user.status != Status.active).toList();
}
