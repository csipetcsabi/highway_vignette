import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/core/widgets/page_shell.dart';
import 'package:highway_vignette/features/highway/presentation/ui/highway_page.dart';

import '../../features/highway/presentation/bloc/highway_bloc.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class AppRoutes {
  static const highway = "/";
  static const countyVignette = "/county_vignette";
  static const purchaseConfirmation = "/purchase_confirmation";
  static const purchaseSuccess = "/purchase_success";
}

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    ShellRoute(
      builder: (context, state, widget) => PageShell(child: widget),
      routes: [
        GoRoute(
          path: AppRoutes.highway,
          builder:
              (context, state) => BlocProvider<HighwayBloc>(
                lazy: false,
                create: (context) => HighwayBloc(),
                child: HighwayPage(),
              ),
        ),
      ],
    ),
  ],
);
