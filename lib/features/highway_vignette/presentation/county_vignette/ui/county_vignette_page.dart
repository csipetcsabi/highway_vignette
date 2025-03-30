import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/args/county_page_args.dart';
import 'package:highway_vignette/utils/price_calculator.dart';

import '../../../../../api/models/counties.dart';
import '../../../../../core/navigation/go_router.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/args/confirmation_page_args.dart';

class CountyVignettePage extends StatefulWidget {
  CountyPageArgs args;

  CountyVignettePage(this.args, {super.key});

  @override
  State<CountyVignettePage> createState() => _CountyVignettePageState();
}

class _CountyVignettePageState extends State<CountyVignettePage> with PriceCalculator{
  List<Counties> selectedCounties = [];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                LocaleKeys.annual_vignette.tr(),
                style: AppTheme.headings4Style,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/map.svg',
                        height: 150,
                      ),
                    ),
                    ...counties(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            Text(
              LocaleKeys.amount_payable.tr(),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Text(
              calculateTotalPrice(getSelectedVignettes(), widget.args.payload),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
              onPressed: selectedCounties.isEmpty ? null :() {
                List<String> selectedVignette = getSelectedVignettes();
                GoRouter.of(context).push(
                  AppRoutes.confirmation,
                  extra: ConfirmationPageArgs(
                    widget.args.payload,
                    widget.args.vehicleInfo,
                    selectedVignette,
                  ),
                );
              },
              child: Text(LocaleKeys.next.tr()),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getSelectedVignettes() {
    return selectedCounties.map((e) => e.id).toList();
  }

  List<Widget> counties() {
    List<Widget> counties = [];
    double price = widget.args.payload.highwayVignettes.firstWhere((item)=> item.vignetteType.contains("YEAR")).sum;

    for (int i = 0; i < widget.args.payload.counties.length; i++) {
      Widget county = CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.args.payload.counties[i].name,
              style: AppTheme.bodyTextStyle6,
            ),
            Text("${price.round()} Ft", style: AppTheme.headings5Style),
          ],
        ),
        value: selectedCounties.contains(widget.args.payload.counties[i]),
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedCounties.add(widget.args.payload.counties[i]);
            } else if (value == false) {
              selectedCounties.remove(widget.args.payload.counties[i]);
            }
          });
        },
      );
      counties.add(county);
    }
    return counties;
  }
}
