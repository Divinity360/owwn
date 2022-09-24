import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';

/// Application extension class
extension StringExtension on String {
  String get toInitials =>
      isNotEmpty ? trim().split(' ').map((l) => l[0]).take(2).join() : '';
}

extension UserListExtension on List<Users> {
  List<Users> get whereStatusIsActive =>
      where((user) => user.status == 'active').toList();
  List<Users> get whereStatusIsNotActive =>
      where((user) => user.status != 'active').toList();
}
