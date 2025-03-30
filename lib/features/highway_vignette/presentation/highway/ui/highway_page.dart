import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/bloc/highway_bloc.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/ui/national_vignettas_card.dart';
import 'package:highway_vignette/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../api/client/client_client.dart';
import '../../../../../core/injection.dart';
import '../../../../../core/navigation/go_router.dart';
import '../../../domain/models/args/confirmation_page_args.dart';
import '../../../domain/models/args/county_page_args.dart';

class HighwayPage extends StatelessWidget {
  const HighwayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HighwayBloc, HighwayState>(
      listener: (context, state) {
        if (state is CountyVignettesAreOpened) {
          GoRouter.of(context).push(
            AppRoutes.countyVignette,
            extra: CountyPageArgs(state.payload),
          );

        } else if (state is PurchaseConfirmationOpened) {
          GoRouter.of(context).push(
            AppRoutes.purchaseConfirmation,
            extra: ConfirmationPageArgs([state.vignette], state.vehicleInfo),
          );
        } else if (state is DataLoadFailed) {
          showErrorDialog(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            vehicleInfoCard(),
            SizedBox(height: 16),
            nacionalVignettasCard(),
            SizedBox(height: 16),
            annualVignettasCard(context),
          ],
        ),
      ),
    );
  }

  Widget vehicleInfoCard() {
    return BlocBuilder<HighwayBloc, HighwayState>(
      buildWhen:
          (previous, current) =>
              current is HighwayInfoLoading || current is HighwayInfoLoaded,
      builder: (context, state) {
        if (state is HighwayInfoLoaded) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: Colors.white,
            hoverColor: Colors.white,
            leading: SvgPicture.asset(
              'assets/icons/car.svg',
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                AppColors.naviColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              state.data.plate,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              state.data.name,
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          );
        } else if (state is HighwayInfoLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              tileColor: Colors.white,
              hoverColor: Colors.white,
              leading: Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 12.0,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 100.0,
                height: 8.0,
                color: Colors.white,
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget nacionalVignettasCard() {
    return BlocBuilder<HighwayBloc, HighwayState>(
      buildWhen:
          (previous, current) =>
              current is HighwayInfoLoading || current is HighwayInfoLoaded,
      builder: (context, state) {
        if (state is HighwayInfoLoaded) {
          return NationalVignettasCard((state).vignettes);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> showErrorDialog(BuildContext context) async {
    HighwayBloc bloc = context.read<HighwayBloc>();
    final TextEditingController controller = TextEditingController();
    controller.text = getIt<ClientClient>().baseUrl ?? "";
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fix Base URL'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Base URL'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                getIt<ClientClient>().baseUrl = controller.text;
                Navigator.of(context).pop();
                bloc.add(HighwayFetchInfosEvent());
              },
            ),
          ],
        );
      },
    );
  }

  Widget annualVignettasCard(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.white,
      hoverColor: Colors.white,
      onTap: () {
        context.read<HighwayBloc>().add(CountyVignettesOpened());
      },
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
        LocaleKeys.annual_vignette.tr(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
