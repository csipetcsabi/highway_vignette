import '../../../../api/models/get_v1_highway_info_response.dart';
import '../../../../api/models/get_v1_highway_vehicle_response.dart';
import '../../../../api/models/post_v1_highway_order_response.dart';

abstract class HighwayRepository {
  Future<GetV1HighwayVehicleResponse> getVehicleInfo();

  Future<GetV1HighwayInfoResponse> getHighwayInfo();

  Future<PostV1HighwayOrderResponse> postHighwayOrder(body);
}
