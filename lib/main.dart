import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/services/storage/storage_service.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:owwn_coding_challenge/utils/theme.dart';
import 'package:owwn_coding_challenge/widgets/trees/multi_provider_tree.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize application secure storage
  AppSecureStorage.init();
  runApp(
    const MultiProviderTree(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Coding Challenge',
      darkTheme: AppThemeData.darkTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.routerConfig,
    );
  }
}
