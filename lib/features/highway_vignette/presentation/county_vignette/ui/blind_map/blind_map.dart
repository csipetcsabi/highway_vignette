import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../domain/models/map_county.dart';
import 'custom_clipper.dart';

class BlindMap extends StatelessWidget {
  final List<MapCounty> counties;
  final List<String > currentCountyIds;
  final Function(MapCounty county)? onCountySelected;

  const BlindMap({
    super.key,
    required this.counties,
    this.currentCountyIds = const [],
    this.onCountySelected,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      minScale: 0.1,
      child: Stack(
        children: [
          for (var country in counties)
            _getClippedImage(
              clipper: Clipper(svgPath: country.path),
              color: currentCountyIds.contains(country.id) ? AppColors.limeColor : AppColors.mapDefaultColor,
              country: country,
              onCountrySelected: onCountySelected,
            ),
        ],
      ),
    );
  }

  Widget _getClippedImage({
    required Clipper clipper,
    required Color color,
    required MapCounty country,
    final Function(MapCounty country)? onCountrySelected,
  }) {
    return ClipPath(
      clipper: clipper,
      child: GestureDetector(
        onTap: () => onCountrySelected?.call(country),
        child: Container(color: color),
      ),
    );
  }
}
