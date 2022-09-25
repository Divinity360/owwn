import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/widgets/avatars/gender_circle.dart';
import 'package:owwn_coding_challenge/widgets/avatars/user_card_avatar.dart';

class UserDetailAvatar extends StatelessWidget {
  const UserDetailAvatar(
      {Key? key, required this.initials, required this.genderIcon})
      : super(key: key);

  final String initials;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserCardAvatar(
          initials: initials,
          showLarge: true,
        ),
        GenderCircle(
          genderIcon: genderIcon,
        )
      ],
    );
  }
}