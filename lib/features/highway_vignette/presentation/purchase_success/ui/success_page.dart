import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/generated/locale_keys.g.dart';

import '../../../../../core/navigation/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.limeColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildConfettiWidget(),
              Spacer(),
              const SizedBox(height: 20),
              buildMessageWidget(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset('assets/images/success_image.png'),
              ),
              buildButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).go(AppRoutes.highway);
        },
        child: Text(LocaleKeys.okay.tr()),
      ),
    );
  }

  Widget buildMessageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        LocaleKeys.successful_payment_message.tr(),
        style: AppTheme.headings1Style,
      ),
    );
  }

  ConfettiWidget buildConfettiWidget() {
    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: true,
      minimumSize: const Size(5, 5),
      maximumSize: const Size(10, 10),
      numberOfParticles: 150,

      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple,
      ],
    );
  }
}
