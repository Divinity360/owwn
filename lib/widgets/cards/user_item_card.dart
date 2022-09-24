import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

enum UserCardPosition { start, middle, last }

class UserListItemCard extends StatelessWidget {
  const UserListItemCard({
    Key? key,
    required this.index,
    this.position = UserCardPosition.middle,
  }) : super(key: key);

  final int index;
  final UserCardPosition position;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _textTheme = Theme.of(context).textTheme;
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
          Container(
            margin: const EdgeInsets.only(left: 10, right: 17),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.onyx,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'UN',
                style: _textTheme.headline5,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'User Name',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'useremail@domain.com',
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
