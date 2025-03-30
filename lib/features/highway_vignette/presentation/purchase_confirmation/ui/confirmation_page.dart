import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/core/navigation/go_router.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/purchase_confirmation/bloc/confirmation_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../generated/locale_keys.g.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmationBloc, ConfirmationState>(
      listener: (context, state) {
        if (state is ConfirmationSuccess) {
          GoRouter.of(context).push(AppRoutes.purchaseSuccess);
        } else if (state is ConfirmationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ConfirmationInitial) {
          return SizedBox();
        }
        if (state is ConfirmationLoaded) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.confirm_payment.tr(),
                    style: AppTheme.headings4Style,
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  vehicleRow(LocaleKeys.plate_number.tr(), state.plateNumber),
                  SizedBox(height: 16),
                  vehicleRow(
                    LocaleKeys.type_of_vignette.tr(),
                    state.vignetteType,
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 32),
                  vignetteList(state),
                  systemUsageFeeRow(state),
                  SizedBox(height: 32),
                  Divider(),
                  SizedBox(height: 32),

                  Text(
                    LocaleKeys.amount_payable.tr(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    state.totalPrice,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ConfirmationBloc>().add(
                        ConfirmationRequested(),
                      );
                    },
                    child: Text(LocaleKeys.next.tr()),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(LocaleKeys.cancel.tr()),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget systemUsageFeeRow(ConfirmationLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.system_usage_fee.tr(),
          style: AppTheme.bodyTextStyle6.copyWith(fontWeight: FontWeight.w300),
        ),
        Text(state.systemUsageFee, style: AppTheme.bodyTextStyle6),
      ],
    );
  }

  Widget vehicleRow(String first, String second) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(first, style: AppTheme.bodyTextStyle6),
        Text(second, style: AppTheme.bodyTextStyle6),
      ],
    );
  }

  Widget vignettingRow(String first, String second) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(first, style: AppTheme.headings5Style),
        Text(second, style: AppTheme.bodyTextStyle6),
      ],
    );
  }

  Widget vignetteList(ConfirmationLoaded state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.vignettes.length,
        itemBuilder: (context, index) {
          final vignette = state.vignettes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(vignette.vignetteName, style: AppTheme.headings5Style),
                Text(vignette.vignettePrice, style: AppTheme.bodyTextStyle6),
              ],
            ),
          );
        },
      ),
    );
  }
}
