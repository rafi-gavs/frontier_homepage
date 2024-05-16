import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../screens/flight_status/repositories/flight_status_repo.dart';
import '../../screens/flight_status/viewmodels/airport_list_vm.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

Future<void> getItInit() async {
  //external / packages
  getIt.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  //services
  getIt.registerLazySingleton<APIService>(
    () => APIServiceImpl(httpClient: getIt()),
  );

  //repositories
  getIt.registerLazySingleton<FlightStatusRepo>(
    () => FlightStatusRepoImpl(apiService: getIt()),
  );

  //providers
  getIt.registerFactory(
    () => AirportListVM(flightStatusRepo: getIt()),
  );
}
