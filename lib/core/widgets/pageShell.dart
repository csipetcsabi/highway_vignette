import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/core/widgets/rounded_appbar.dart';

import '../../generated/locale_keys.g.dart';
import '../theme/app_colors.dart';

class PageShell extends StatelessWidget {
  final Widget child;

  const PageShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.getBackgroundColor(context),
        appBar: RoundedBottomAppBar(
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            title: Text(LocaleKeys.e_vignette.tr()),
          ),
        ),
        body: SafeArea(child: child),
      ),
    );
  }
}
