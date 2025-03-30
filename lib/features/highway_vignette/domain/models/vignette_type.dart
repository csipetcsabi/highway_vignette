import 'package:easy_localization/easy_localization.dart';

import '../../../../generated/locale_keys.g.dart';

enum VignetteType {
  day(key: "DAY", localizedKey: LocaleKeys.day_vignette),
  month(key: "MONTH", localizedKey: LocaleKeys.monthly_vignette),
  week(key: "WEEK", localizedKey: LocaleKeys.weekly_vignette),
  year(key: "YEAR", localizedKey: LocaleKeys.annual_vignette);

  final String key;
  final String localizedKey;

  const VignetteType({required this.key, required this.localizedKey});

  String getLocalizedText() {
    return localizedKey.tr();
  }

  static VignetteType getByKey(String key) {
    return VignetteType.values.firstWhere(
      (vignetteType) => vignetteType.key == key,
      orElse: () => VignetteType.year,
    );
  }
}
