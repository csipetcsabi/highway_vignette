import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

import '../features/highway_vignette/domain/models/map_county.dart';

class MapUtils {
  static Future<List<MapCounty>> loadSvgImage({required String svgImage}) async {
    List<MapCounty> maps = [];
    String generalString = await rootBundle.loadString(svgImage);

    XmlDocument document = XmlDocument.parse(generalString);

    final paths = document.findAllElements('path');

    for (var element in paths) {
      String partId = element.getAttribute('id').toString();
      String partPath = element.getAttribute('d').toString();
      String name = element.getAttribute('name').toString();
      String color = element.getAttribute('color')?.toString() ?? 'D7D3D2';
      String strokeMiterlimit = element.getAttribute("stroke-miterlimit")?.toString() ?? '10';

      maps.add(
        MapCounty(
          id: partId,
          path: partPath,
          color: color,
          name: name,
            strokeMiterlimit: strokeMiterlimit
        ),
      );
    }

    return maps;
  }
}
