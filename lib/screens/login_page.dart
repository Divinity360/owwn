import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/pages/login_page_provider.dart';
import 'package:owwn_coding_challenge/widgets/textfields/primary_textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Consumer<LoginPageProvider>(
          builder: (context, loginProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mike',
                  style: _textTheme.headline1,
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                  hintText: 'Enter your email',
                  controller: loginProvider.emailController,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
