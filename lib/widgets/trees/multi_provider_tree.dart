import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/auth/auth_provider.dart';
import 'package:owwn_coding_challenge/providers/pages/login_page_provider.dart';
import 'package:owwn_coding_challenge/providers/widgets/overlapping_appbar_provider.dart';
import 'package:provider/provider.dart';

class MultiProviderTree extends StatelessWidget {
  final Widget child;

  const MultiProviderTree({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<LoginPageProvider>(
          create: (context) => LoginPageProvider(),
        )
      ],
      child: child,
    );
  }
}
