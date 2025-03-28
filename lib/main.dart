import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_vignette/core/injection.dart';
import 'package:highway_vignette/core/navigation/go_router.dart';
import 'package:highway_vignette/core/theme/app_theme.dart';

import 'core/MyBlocObserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  getItSetup();
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
