// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "e_vignette": "E-vignette",
  "national_vignette": "National vignette",
  "annual_vignette": "Annual country vignette",
  "purchase": "Purchase",
  "next": "Next",
  "cancel": "Cancel",
  "amount_payable": "Amount Payable",
  "confirm_payment": "Confirm payment",
  "plate_number": "Plate number",
  "type_of_vignette": "Vignette type",
  "system_usage_fee": "System usage fee",
  "successful_payment_message": "You have successfully paid for the sticker!",
  "okay": "Okay",
  "weekly_vignette": "weekly (10 days)",
  "monthly_vignette": "monthly",
  "day_vignette": "daily (1 day)"
};
static const Map<String,dynamic> _hu = {
  "e_vignette": "E-matrica",
  "national_vignette": "Országos matricák",
  "annual_vignette": "Éves vármegyei matricák",
  "purchase": "Vásárlás",
  "next": "Tovább",
  "cancel": "Mégse",
  "amount_payable": "Fizetendő összeg",
  "confirm_payment": "Vásárlás megerősítése",
  "plate_number": "Rendszám",
  "type_of_vignette": "Matrica típusa",
  "system_usage_fee": "Rendszerhasználati díj",
  "successful_payment_message": "A matricákat sikeresen kifizetted!",
  "okay": "Rendben",
  "weekly_vignette": "heti (10 napos)",
  "monthly_vignette": "havi",
  "day_vignette": "napi (1 napos)"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "hu": _hu};
}
