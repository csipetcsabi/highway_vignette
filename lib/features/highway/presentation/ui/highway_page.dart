import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/generated/locale_keys.g.dart';

class HighwayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          vehicleInfoCard(),
          SizedBox(height: 16),
          nacionalVignettasCard(),
          SizedBox(height: 16),
          annualVignettasCard(),
        ],
      ),
    );
  }

  Widget vehicleInfoCard() {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.white,
      hoverColor: Colors.white,
      leading: SvgPicture.asset(
        'assets/icons/car.svg',
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(AppColors.naviColor, BlendMode.srcIn),
      ),
      title: Text('ABC 123', style: TextStyle(fontWeight: FontWeight.w300)),
      subtitle: Text(
        'Michael Scott',
        style: TextStyle(fontWeight: FontWeight.w100),
      ),
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

  Widget annualVignettasCard() {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.white,
      hoverColor: Colors.white,
      onTap: (){

      },
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(LocaleKeys.annual_vignette.tr()),
    );
  }
}
