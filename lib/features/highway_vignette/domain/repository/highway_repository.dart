import '../../../../api/models/get_v1_highway_vehicle_response.dart';

abstract class HighwayRepository {
  Future<GetV1HighwayVehicleResponse> getVehicleInfo();
}
