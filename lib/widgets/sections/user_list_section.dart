import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/utils/extensions.dart';
import 'package:owwn_coding_challenge/widgets/sections/user_list_section_by_status.dart';

class SectionedUserList extends StatelessWidget {
  const SectionedUserList(
      {Key? key, required this.userList, required this.index})
      : super(key: key);
  final List<Users> userList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final activeUserList = userList.whereStatusIsActive;
    final inActiveUserList = userList.whereStatusIsNotActive;
    return Column(
      children: [
        if (activeUserList.isNotEmpty)
          SectionedUserListByStatus(
            parentIndex: index,
            isActive: true,
            userList: userList.whereStatusIsActive,
          ),
        if (inActiveUserList.isNotEmpty)
          SectionedUserListByStatus(
            parentIndex: index,
            isActive: false,
            userList: userList.whereStatusIsNotActive,
          ),
      ],
    );
  }
}
