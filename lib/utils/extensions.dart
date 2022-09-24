import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';

/// Application extension class
extension StringExtension on String {
  String get toInitials =>
      isNotEmpty ? trim().split(' ').map((l) => l[0]).take(2).join() : '';
}

