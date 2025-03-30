import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:highway_vignette/api/client/client_client.dart';

import '../features/highway_vignette/data/repository/highway_repository_impl.dart';
import '../features/highway_vignette/domain/repository/highway_repository.dart';
import 'app_constants.dart';

final getIt = GetIt.instance;

void getItSetup() {
  final dio = Dio();
  //fixme
  getIt.registerLazySingleton<ClientClient>(
    () => ClientClient(dio, baseUrl: AppConstants.defaultBaseUrl),
  );

  getIt.registerLazySingleton<HighwayRepository>(
    () => HighwayRepositoryImpl(client: getIt<ClientClient>()),
  );
}
