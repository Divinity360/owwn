import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/providers/pages/user_list_page_provider.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';
import 'package:provider/provider.dart';

class SectionedUserListByStatus extends StatelessWidget {
  const SectionedUserListByStatus({
    Key? key,
    required this.isActive,
    required this.userList,
    required this.parentIndex,
  }) : super(key: key);

  final bool isActive;
  final int parentIndex;
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
          itemCount: userList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Consumer<UserListPageProvider>(
              builder: (context, provider, child) {
                final user = userList.elementAt(index);
                return UserListItemCard(
                  user: user,
                  position: _getPositionFromIndex(
                    index: index,
                    lastIndex: userList.length - 1,
                  ),
                  onTap: () => provider.onUserTap(
                    context,
                    parentIndex: parentIndex,
                    user: user,
                  ),
                );
              },
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
