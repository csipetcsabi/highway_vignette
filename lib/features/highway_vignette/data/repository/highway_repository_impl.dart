import '../../../../api/client/client_client.dart';
import '../../../../api/models/get_v1_highway_vehicle_response.dart';
import '../../domain/repository/highway_repository.dart';

class HighwayRepositoryImpl implements HighwayRepository {
  final ClientClient client;

  HighwayRepositoryImpl({required this.client});

  Future<GetV1HighwayVehicleResponse> getVehicleInfo() async {
    return await client.getVehicleInfo();
  }
}
