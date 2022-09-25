import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/providers/pages/user_detail_page_provider.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';
import 'package:owwn_coding_challenge/utils/extensions.dart';
import 'package:owwn_coding_challenge/widgets/avatars/user_detail_avatar.dart';
import 'package:owwn_coding_challenge/widgets/buttons/primary_button.dart';
import 'package:owwn_coding_challenge/widgets/textfields/primary_textfield.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  final Users user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider<UserDetailPageProvider>(
      create: (context) => UserDetailPageProvider(widget.user),
      child: Consumer<UserDetailPageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: [
                    Hero(
                      tag: '${AppConstants.userHeroTag}${provider.user!.id}',
                      child: UserDetailAvatar(
                        initials: provider.user!.name!.toInitials,
                        genderIcon: provider.user!.gender == Gender.male
                            ? Icons.male
                            : provider.user!.gender == Gender.female
                                ? Icons.female
                                : Icons.transgender,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 15),
                      child: PrimaryTextField(
                        controller: provider.nameController,
                        hintText: "Unknown",
                        hintStyle: _textTheme.headline1!.copyWith(
                            color: AppColors.quickSilver.withOpacity(.3)),
                        textStyle: _textTheme.headline1,
                        onChanged: provider.onNameChanged,
                      ),
                    ),
                    PrimaryTextField(
                      controller: provider.emailController,
                      hintText: "unknown@email.com",
                      hintStyle: _textTheme.headline4!.copyWith(
                          color: AppColors.quickSilver.withOpacity(.3)),
                      textStyle: _textTheme.headline4,
                      onChanged: provider.onEmailChanged,
                    ),
                    if (provider.isAnyUserFieldEdited)
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: PrimaryButton(
                          text: 'SAVE',
                          onTap: provider.onSaveTap,
                        ),
                      )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
