import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';
import 'package:owwn_coding_challenge/utils/extensions.dart';
import 'package:owwn_coding_challenge/widgets/avatars/user_card_avatar.dart';

enum UserCardPosition { start, middle, last }

class UserListItemCard extends StatelessWidget {
  const UserListItemCard({
    Key? key,
    required this.user,
    this.position = UserCardPosition.middle,
  }) : super(key: key);

  final Users user;
  final UserCardPosition position;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 62,
      margin: const EdgeInsets.only(bottom: 2),
      width: _screenWidth,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: position == UserCardPosition.start
            ? const BorderRadius.only(
                topRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
              )
            : position == UserCardPosition.last
                ? const BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  )
                : BorderRadius.zero,
      ),
      child: Row(
        children: [
          UserCardAvatar(initials: user.name!.toInitials),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 300,
                  child:  Text(
                  user.name!,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),),
              ),
              Text(
                user.email ?? 'unknown email',
                style: TextStyle(
                  color: AppColors.silver,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

