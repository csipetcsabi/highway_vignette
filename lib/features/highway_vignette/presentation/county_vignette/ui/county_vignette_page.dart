import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/args/county_page_args.dart';
import 'package:highway_vignette/utils/county_util.dart';
import 'package:highway_vignette/utils/map_utils.dart';
import 'package:highway_vignette/utils/price_calculator.dart';

import '../../../../../core/navigation/go_router.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/args/confirmation_page_args.dart';
import '../../../domain/models/map_county.dart';
import 'blind_map/blind_map.dart';

class CountyVignettePage extends StatefulWidget {
  final CountyPageArgs args;

  const CountyVignettePage(this.args, {super.key});

  @override
  State<CountyVignettePage> createState() => _CountyVignettePageState();
}

class _CountyVignettePageState extends State<CountyVignettePage>
    with PriceCalculator {
  List<String> selectedCounties = [];
  bool isConnected = true;

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
                      child: buildBlindMap(),
                    ),
                    ...counties(),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isConnected,
              //fixme localization
              child: Text(
                LocaleKeys.no_county_connection.tr(),
                style: TextStyle(color: Colors.orange),
              ),
            ),
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
              onPressed:
                  selectedCounties.isEmpty
                      ? null
                      : () {
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
    return selectedCounties;
  }

  List<Widget> counties() {
    List<Widget> counties = [];
    double price =
        widget.args.payload.highwayVignettes
            .firstWhere((item) => item.vignetteType.contains("YEAR"))
            .sum;

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
        value: selectedCounties.contains(widget.args.payload.counties[i].id),
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedCounties.add(widget.args.payload.counties[i].id);
            } else if (value == false) {
              selectedCounties.remove(widget.args.payload.counties[i].id);
            }
            isConnected = CountyUtil.areCountiesConnected(selectedCounties);
          });
        },
      );
      counties.add(county);
    }
    return counties;
  }

  Widget buildBlindMap() {
    return SizedBox(
      height: 200,
      width: 400,
      child: FutureBuilder(future: MapUtils.loadSvgImage(svgImage: 'assets/images/map.svg'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlindMap(
                counties: snapshot.data!,
                currentCountyIds: selectedCounties,
                onCountySelected: (MapCounty county) {

                  setState(() {
                    List<String> selectedCountiesIds = selectedCounties.toList();
                    if (selectedCountiesIds.contains(county.id)) {
                      selectedCounties.remove(county.id);
                    } else {
                      selectedCounties.add(county.id);
                    }
                    isConnected = CountyUtil.areCountiesConnected(selectedCounties);
                  });
                },
              );
            } else  if (snapshot.hasError) {
              return Text('Hiba: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },

      ),
    );
  }
}
