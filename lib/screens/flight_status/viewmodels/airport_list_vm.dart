import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/repositories/flight_status_repo.dart';
import 'package:frontier_homepage/util/appstring.dart';

import '../models/airport_model.dart';

class AirportListVM with ChangeNotifier {
  final FlightStatusRepo flightStatusRepo;

  AirportListVM({
    required this.flightStatusRepo,
  });

  //state
  bool _isLoading = false;
  String? _error;
  List<AirportModel> _airportList = [];

  //state getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<AirportModel> get airportList => _airportList;

  //state setters
  void _setLoading(bool value) {
    _isLoading = value;
  }

  void _setError(String value) {
    _error = value;
  }

  void _setAirportList(List<AirportModel> value) {
    _airportList = value;
  }

  void getOriginAirportList() async {
    try {
      _setLoading(true);
      var result = await flightStatusRepo.getOriginAirportList();
      _setAirportList(result);
      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setError(AppString.somethingWentWrong);
      _setLoading(false);
      notifyListeners();
    }
  }

  void getDestinationAirportList({
    required String originAirport,
  }) async {
    try {
      //set loading
      _setLoading(true);

      //call api
      var result = await flightStatusRepo.getDestinationAirportList(
        originAirport: originAirport,
      );

      //set result
      _setAirportList(result);

      //set loading
      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setError(AppString.somethingWentWrong);
      _setLoading(false);
      notifyListeners();
    }
  }
}
