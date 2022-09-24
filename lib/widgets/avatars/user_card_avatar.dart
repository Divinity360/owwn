import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

class UserCardAvatar extends StatelessWidget {
  const UserCardAvatar({
    Key? key,
    required this.initials,
  }) : super(key: key);

  final String initials;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 17),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: AppColors.onyx,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: _textTheme.headline5,
        ),
      ),
    );
  }
}