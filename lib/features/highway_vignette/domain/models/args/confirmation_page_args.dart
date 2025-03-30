import 'package:highway_vignette/api/export.dart';


class ConfirmationPageArgs {
  Payload payload;
  GetV1HighwayVehicleResponse vehicleInfo;
  List<String> selectgedVignettesType = [];

  ConfirmationPageArgs(this.payload, this.vehicleInfo, this.selectgedVignettesType);
}
