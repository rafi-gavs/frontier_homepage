import 'dart:convert';

import 'package:http/http.dart';

class APIResponse {
  final int statusCode;
  final dynamic data;

  APIResponse({
    this.statusCode = 0,
    this.data = const {},
  });

  factory APIResponse.fromJson(Map json) {
    return APIResponse(
      statusCode: json['status'],
      data: json['data'],
    );
  }
}
