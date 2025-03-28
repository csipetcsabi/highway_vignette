import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/bloc/highway_bloc.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/ui/national_vignettasCard.dart';
import 'package:highway_vignette/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';

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
      buildWhen:
          (previous, current) =>
              current is VehicleInfoLoading || current is VehicleInfoLoaded,
      builder: (context, state) {
        if (state is VehicleInfoLoaded) {
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
        } else if (state is VehicleInfoLoading) {
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
      current is VehicleInfoLoading || current is HighwayInfoLoaded,
      builder: (context, state) {
        if (state is HighwayInfoLoaded) {
          return NationalVignettasCard((state as HighwayInfoLoaded).vignettes);
        }
        return Center(child: CircularProgressIndicator());
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
      title: Text(LocaleKeys.annual_vignette.tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }

}
