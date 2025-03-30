// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/get_v1_highway_info_response.dart';
import '../models/get_v1_highway_vehicle_response.dart';
import '../models/object0.dart';
import '../models/post_v1_highway_order_response.dart';

part 'client_client.g.dart';

@RestApi( )
abstract class ClientClient {
  factory ClientClient(Dio dio, {String? baseUrl}) = _ClientClient;
  String? baseUrl;

  /// Retrieve highway vignette information
  @GET('/v1/highway/info')
  Future<GetV1HighwayInfoResponse> getHighwayInfo();

  /// Retrieve vehicle information
  @GET('/v1/highway/vehicle')
  Future<GetV1HighwayVehicleResponse> getVehicleInfo();

  /// Place an order for highway vignettes.
  ///
  /// [body] - Name not received and was auto-generated.
  @POST('/v1/highway/order')
  Future<PostV1HighwayOrderResponse> postHighwayOrder({
    @Body() required Object0 body,
  });
}
