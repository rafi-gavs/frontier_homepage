class AirportModel {
  String code;
  String cityName;
  String provinceOrStateName;
  String countryName;
  String? stateCode;
  String stateName;
  String countryCode;
  String lat;
  String long;

  AirportModel({
    required this.code,
    required this.cityName,
    required this.provinceOrStateName,
    required this.countryName,
    required this.stateCode,
    required this.stateName,
    required this.countryCode,
    required this.lat,
    required this.long,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        code: json["code"],
        cityName: json["cityName"],
        provinceOrStateName: json["provinceOrStateName"],
        countryName: json["countryName"],
        stateCode: json["stateCode"],
        stateName: json["stateName"],
        countryCode: json["countryCode"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "cityName": cityName,
        "provinceOrStateName": provinceOrStateName,
        "countryName": countryName,
        "stateCode": stateCode,
        "stateName": stateName,
        "countryCode": countryCode,
        "lat": lat,
        "long": long,
      };
}
