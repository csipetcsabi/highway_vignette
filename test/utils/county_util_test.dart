import 'package:flutter_test/flutter_test.dart';
import 'package:highway_vignette/api/models/counties.dart';
import 'package:highway_vignette/utils/countyUtil.dart';

void main() {
  group('areCountiesConnected', () {
    test('returns true when all selected counties are connected', () {
      List<Counties> selectedCounties = [
        Counties(id: 'YEAR_11', name: 'County 1'), // Bács-Kiskun
        Counties(id: 'YEAR_16', name: 'County 2'), // Fejér
        Counties(id: 'YEAR_26', name: 'County 3'), //Tolna
      ];

      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });

    test('returns false when selected counties are not connected', () {
      List<Counties> selectedCounties = [
        Counties(id: 'YEAR_11', name: 'County 1'),// Bács-Kiskun
        Counties(id: 'YEAR_12', name: 'County 2'),// Baranya
      ];

      expect(CountyUtil.areCountiesConnected(selectedCounties), isFalse);
    });

    test('returns true when only one county is selected', () {
      List<Counties> selectedCounties = [
        Counties(id: 'YEAR_11', name: 'County 1'),// Bács-Kiskun
      ];

      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });

    test('returns true when no counties are selected', () {
      List<Counties> selectedCounties = [];

      expect(CountyUtil.areCountiesConnected(selectedCounties), isTrue);
    });
  });
}
