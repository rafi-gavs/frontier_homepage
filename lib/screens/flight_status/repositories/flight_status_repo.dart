import 'package:frontier_homepage/cms_service/sanity_api.dart';

import '../../../core/services/api_service.dart';
import '../../../util/api_urls.dart';
import '../models/airport_model.dart';

abstract class FlightStatusRepo {
  Future<List<AirportModel>> getOriginAirportList();
  Future<List<AirportModel>> getDestinationAirportList({
    required String originAirport,
  });
}

class FlightStatusRepoImpl implements FlightStatusRepo {
  final APIService apiService;

  FlightStatusRepoImpl({
    required this.apiService,
  });

  @override
  Future<List<AirportModel>> getOriginAirportList() async {
    // TODO: implement getOriginAirportList
    try {
      var result = await apiService.get(path: APIUrls.getOriginAirportList);
      var list = (result.data as List).map((e) => AirportModel.fromJson(e)).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AirportModel>> getDestinationAirportList({
    required String originAirport,
  }) async {
    // TODO: implement getDestinationAirportList
    try {
      var query = {"originAirport": originAirport};
      var result = await apiService.get(path: APIUrls.getDestinationAirports, query: query);
      var list = (result.data as List).map((e) => AirportModel.fromJson(e)).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
