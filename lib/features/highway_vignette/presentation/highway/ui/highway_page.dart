import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/bloc/highway_bloc.dart';
import 'package:highway_vignette/generated/locale_keys.g.dart';

class HighwayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HighwayBloc, HighwayState>(
      listener: (context, state) {
        if (state is CountyVignettesAreOpened) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              //fixme
              content: Text("Opening county vignettes..."),
              duration: const Duration(seconds: 3),
            ),
          );
          /*          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CountyVignettesPage(),
            ),
          );*/
        }

        if (state is DataLoadFailed) {
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
      builder: (context, state) {
        if (state is DataLoaded) {
          return ListTile(
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
              //'ABC 123',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            subtitle: Text(state.data.name,
              //'Michael Scott',
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget nacionalVignettasCard() {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Text(
            LocaleKeys.national_vignette.tr(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(LocaleKeys.purchase.tr()),
          ),
        ],
      ),
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
      title: Text(LocaleKeys.annual_vignette.tr()),
    );
  }
}
