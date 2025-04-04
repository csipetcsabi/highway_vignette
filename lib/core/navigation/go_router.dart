import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/core/widgets/page_shell.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/county_vignette/bloc/county_vignette_bloc.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/county_vignette/ui/county_vignette_page.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/ui/highway_page.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/purchase_confirmation/ui/confirmation_page.dart';

import '../../features/highway_vignette/domain/models/args/confirmation_page_args.dart';
import '../../features/highway_vignette/domain/models/args/county_page_args.dart';
import '../../features/highway_vignette/domain/repository/highway_repository.dart';
import '../../features/highway_vignette/presentation/highway/bloc/highway_bloc.dart';
import '../../features/highway_vignette/presentation/purchase_confirmation/bloc/confirmation_bloc.dart';
import '../../features/highway_vignette/presentation/purchase_success/ui/success_page.dart';
import '../injection.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class AppRoutes {
  static const highway = "/";
  static const countyVignette = "/county_vignette";
  static const confirmation = "/confirmation";
  static const purchaseSuccess = "/purchase_success";
}

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.purchaseSuccess,
      builder:
          (context, state) => SuccessPage(),
    ),
    ShellRoute(
      builder:
          (context, state, widget) =>
          PageShell(
            backgroundColor: _getBackgroundColor(state),
            child: widget,
          ),
      routes: [
        GoRoute(
          path: AppRoutes.highway,
          builder:
              (context, state) =>
              BlocProvider<HighwayBloc>(
                lazy: false,
                create: (context) => HighwayBloc(getIt<HighwayRepository>()),
                child: HighwayPage(),
              ),
        ),
        GoRoute(
          path: AppRoutes.confirmation,
          builder:
              (context, state) =>
              BlocProvider(
                create:
                    (context) =>
                    ConfirmationBloc(state.extra as ConfirmationPageArgs, getIt<HighwayRepository>()),
                child: ConfirmationPage(),
              ),
        ),
        GoRoute(
          path: AppRoutes.countyVignette,
          builder:
              (context, state) =>
              BlocProvider(
                create:
                    (context) =>
                    CountyVignetteBloc(state.extra as CountyPageArgs),
                child: CountyVignettePage(state.extra as CountyPageArgs),
              ),
        )
      ],
    ),
  ],
);

Color _getBackgroundColor(GoRouterState state) {
  switch (state.matchedLocation) {
    case AppRoutes.highway:
      return AppColors.lightGrayColor;
    case AppRoutes.confirmation:
      return Colors.white;
    default:
      return Colors.white;
  }
}
