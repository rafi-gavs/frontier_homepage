class AppFunctions {
  static String getAirportTitle({
    required String code,
    required String cityName,
    required String countryCode,
  }) {
    return '$cityName, $countryCode ($code)';
  }
}
