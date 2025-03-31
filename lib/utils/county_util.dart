
class CountyUtil{

  static bool areCountiesConnected(List<String> selectedCounties) {
    if (selectedCounties.length > 1) {
      Set<String> connections = {};
      List<String> counties = selectedCounties.toList();
      String first = counties.removeAt(0);
      connections.addAll(_connectionMap[first]!);

      while (counties.isNotEmpty) {
        List<String> contained =
        counties.where((item) => connections.contains(item)).toList();
        if (contained.isEmpty && counties.isNotEmpty) {
          return false;
        }
        for (String selected in contained) {
          connections.addAll(_connectionMap[selected]!);
          counties.remove(selected);
        }
      }
      return true;
    }
    return true;
  }



   static final Map<String, List<String>> _connectionMap = {
    'YEAR_11': ['YEAR_16', 'YEAR_26'],
    // Bács-Kiskun
    'YEAR_12': ['YEAR_24', 'YEAR_26'],
    // Baranya
    'YEAR_13': ['YEAR_20', 'YEAR_18', 'YEAR_15'],
    // Békés
    'YEAR_14': ['YEAR_19', 'YEAR_25', 'YEAR_20'],
    // Borsod-Abaúj-Zemplén
    'YEAR_15': ['YEAR_13', 'YEAR_20', 'YEAR_19', 'YEAR_11'],
    // Csongrád
    'YEAR_16': [
      'YEAR_23',
      'YEAR_21',
      'YEAR_28',
      'YEAR_24',
      'YEAR_26',
      'YEAR_11',
    ],
    // Fejér
    'YEAR_17': ['YEAR_21', 'YEAR_28', 'YEAR_27', 'YEAR_16'],
    // Győr-Moson-Sopron
    'YEAR_18': ['YEAR_13', 'YEAR_20', 'YEAR_25'],
    // Hajdú-Bihar
    'YEAR_19': ['YEAR_25', 'YEAR_14', 'YEAR_20', 'YEAR_23', 'YEAR_22'],
    // Heves
    'YEAR_20': [
      'YEAR_23',
      'YEAR_11',
      'YEAR_15',
      'YEAR_13',
      'YEAR_18',
      'YEAR_25',
      'YEAR_14',
      'YEAR_19',
    ],
    // Jász-Nagykun-Szolnok
    'YEAR_21': ['YEAR_23', 'YEAR_16', 'YEAR_28', 'YEAR_17'],
    // Komárom-Esztergom
    'YEAR_22': ['YEAR_19', 'YEAR_23'],
    // Nógrád
    'YEAR_23': [
      'YEAR_21',
      'YEAR_16',
      'YEAR_11',
      'YEAR_20',
      'YEAR_19',
      'YEAR_22',
    ],
    // Pest
    'YEAR_24': ['YEAR_29', 'YEAR_28', 'YEAR_16', 'YEAR_26', 'YEAR_12'],
    // Somogy
    'YEAR_25': ['YEAR_18', 'YEAR_20', 'YEAR_19', 'YEAR_14'],
    // Szabolcs-Szatmár-Bereg
    'YEAR_26': ['YEAR_24', 'YEAR_12', 'YEAR_11', 'YEAR_16'],
    // Tolna
    'YEAR_27': ['YEAR_17', 'YEAR_28', 'YEAR_29'],
    // Vas
    'YEAR_28': ['YEAR_17', 'YEAR_21', 'YEAR_16', 'YEAR_24', 'YEAR_29'],
    // Veszprém
    'YEAR_29': ['YEAR_27', 'YEAR_28', 'YEAR_24'],
    // Zala
  };

}