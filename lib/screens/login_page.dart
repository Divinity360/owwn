import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/pages/login_page_provider.dart';
import 'package:owwn_coding_challenge/widgets/buttons/primary_button.dart';
import 'package:owwn_coding_challenge/widgets/textfields/primary_textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<LoginPageProvider>(
          builder: (context, loginProvider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: Text(
                    'Login',
                    style: _textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 114),
                  child: PrimaryTextField(
                    hintText: 'Enter your email',
                    controller: loginProvider.emailController,
                  ),
                ),
                PrimaryButton(
                  text: 'SAVE',
                  isLoading: loginProvider.loading,
                  onTap: () => loginProvider.onLoginBtnTapped(context),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
