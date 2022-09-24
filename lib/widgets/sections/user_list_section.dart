import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';

class SectionedUserList extends StatelessWidget {
  const SectionedUserList({
    Key? key,
    required this.isActive,
    required this.userList,
  }) : super(key: key);

  final bool isActive;
  final List<Users> userList;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isActive ? 'Active' : 'Inactive',
          style: _textTheme.headline2,
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return UserListItemCard(
              index: index,
              position: _getPositionFromIndex(index: index, lastIndex: 3 - 1),
            );
          },
        ),
      ],
    );
  }

  /// Retrieve [UserCardPosition] from list index
  UserCardPosition _getPositionFromIndex({
    required int index,
    required int lastIndex,
  }) {
    return index == 0
        ? UserCardPosition.start
        : index == lastIndex
            ? UserCardPosition.last
            : UserCardPosition.middle;
  }
}