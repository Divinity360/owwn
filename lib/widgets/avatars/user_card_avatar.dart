import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

class UserCardAvatar extends StatelessWidget {
  const UserCardAvatar({
    Key? key,
    required this.initials,
    this.showLarge = false,
  }) : super(key: key);

  final String initials;
  final bool showLarge;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _avatarSize = showLarge ? 130.0 : 45.0;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 17),
      height: _avatarSize,
      width: _avatarSize,
      decoration: BoxDecoration(
        color: AppColors.onyx,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: showLarge ? _textTheme.headline1 : _textTheme.headline5,
        ),
      ),
    );
  }
}
