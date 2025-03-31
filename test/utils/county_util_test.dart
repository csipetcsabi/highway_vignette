import 'package:flutter_test/flutter_test.dart';
import 'package:highway_vignette/utils/county_util.dart';

void main() {
  group('areCountiesConnected', () {
    test('returns true when all selected counties are connected', () {
      List<String> selectedCounties = ["YEAR_11", "YEAR_16", "YEAR_26"];
         // Bács-Kiskun
        // Fejér
        //Tolna


      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });

    test('returns false when selected counties are not connected', () {
      List<String> selectedCounties = ["YEAR_11", "YEAR_12"];
        // Bács-Kiskun
        // Baranya


      expect(CountyUtil.areCountiesConnected(selectedCounties), isFalse);
    });

    test('returns true when only one county is selected', () {
      List<String> selectedCounties = ["YEAR_11"];
       // Bács-Kiskun


      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });

    test('returns true when no counties are selected', () {
      List<String> selectedCounties = [];

      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });
  });
}
