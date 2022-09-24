import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:owwn_coding_challenge/widgets/buttons/start_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.translate(
          offset: const Offset(0, -68),
          child: StartButton(
                onTap: () => context.push(AppRouter.login),),
        ),
      ),
    );
  }
}
