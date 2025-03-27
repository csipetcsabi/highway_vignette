import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:highway_vignette/core/injection.dart';
import 'package:highway_vignette/core/navigation/go_router.dart';
import 'package:highway_vignette/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en'), Locale('hu')],
      fallbackLocale: Locale('hu'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routerConfig: appRouter,
      theme: AppTheme.themeDataLight(),
      // darkTheme: darkTheme,

    );
  }
}
