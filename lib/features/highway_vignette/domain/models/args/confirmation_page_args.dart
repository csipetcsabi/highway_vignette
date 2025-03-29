import 'package:highway_vignette/api/models/get_v1_highway_vehicle_response.dart';

import '../../../../../api/models/highway_vignettes.dart';

class ConfirmationPageArgs {
  List<HighwayVignettes> vignettes;
  GetV1HighwayVehicleResponse vehicleInfo;

  ConfirmationPageArgs(this.vignettes, this.vehicleInfo);
}
