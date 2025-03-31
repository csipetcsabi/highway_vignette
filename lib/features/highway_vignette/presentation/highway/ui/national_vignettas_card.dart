import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_vignette/core/theme/app_colors.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/vignette_type.dart';
import 'package:highway_vignette/features/highway_vignette/presentation/highway/bloc/highway_bloc.dart';

import '../../../../../api/models/highway_vignettes.dart';
import '../../../../../generated/locale_keys.g.dart';

class NationalVignettasCard extends StatefulWidget {
  final List<HighwayVignettes> vignettes;

  const NationalVignettasCard(this.vignettes, {super.key});

  @override
  State<NationalVignettasCard> createState() => _NationalVignettasCardState();
}

class _NationalVignettasCardState extends State<NationalVignettasCard> {
  String? _selectedVignette;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            vignetteList(),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed:
                    _selectedVignette != null
                        ? () {
                          context.read<HighwayBloc>().add(
                            PurchaseRequested(_selectedVignette!),
                          );
                        }
                        : null,
                child: Text(LocaleKeys.purchase.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
      child: Text(
        LocaleKeys.national_vignette.tr(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget vignetteList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.vignettes.length,
      itemBuilder: (context, index) {
        final isSelected = widget.vignettes[index] == _selectedVignette;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected
                      ? Theme.of(context).primaryColor
                      : AppColors.lightGrayColor_2,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: RadioListTile<String>(
            activeColor: Theme.of(context).primaryColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _tileTitle(widget.vignettes[index]),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${widget.vignettes[index].cost.round()} Ft",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            value: widget.vignettes[index].vignetteType.first,
            groupValue: _selectedVignette,
            onChanged: (value) {
              setState(() {
                _selectedVignette = value;
              });
            },
          ),
        );
      },
    );
  }

  String _tileTitle(HighwayVignettes vignett) {
    String type = vignett.vignetteType
        .map((item) => VignetteType.getByKey(item).getLocalizedText())
        .join(",");
    //fixme
    return "D1 - $type";
  }
}
