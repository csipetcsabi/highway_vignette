import '../../../../api/client/client_client.dart';
import '../../../../api/models/get_v1_highway_info_response.dart';
import '../../../../api/models/get_v1_highway_vehicle_response.dart';
import '../../../../api/models/post_v1_highway_order_response.dart';
import '../../domain/repository/highway_repository.dart';

class HighwayRepositoryImpl implements HighwayRepository {
  final ClientClient client;

  HighwayRepositoryImpl({required this.client});

  Future<GetV1HighwayVehicleResponse> getVehicleInfo() async {
    return await client.getVehicleInfo();
  }

  Future<GetV1HighwayInfoResponse> getHighwayInfo() async {
    return await client.getHighwayInfo();
  }

  Future<PostV1HighwayOrderResponse> postHighwayOrder(body) async {
    return await client.postHighwayOrder(body: body);
  }
}
