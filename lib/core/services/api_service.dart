import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontier_homepage/core/app_errors/app_exceptions.dart';
import 'package:http/http.dart' as http;
import '../../util/api_urls.dart';
import '../models/api_response.dart';

abstract class APIService {
  Future<APIResponse> get({
    required String path,
    Map<String, String>? query,
  });

  Future<APIResponse> post({
    required String path,
    Map<String, String>? query,
    Object? body,
  });
}

class APIServiceImpl implements APIService {
  final http.Client httpClient;

  APIServiceImpl({
    required this.httpClient,
  });

  @override
  Future<APIResponse> get({
    required String path,
    Map<String, String>? query,
  }) async {
    // TODO: implement get
    try {
      var headers = {
        "authToken":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVbmtub3duIiwianRpIjoiZDBhYmEwOWUtYjUwMi04YTJhLTY3MmItOTg4YmM4NTQ3MGFhIiwiaXNzIjoiZG90UkVaIEFQSSJ9.q59-46YbKcN_UnCHp-7Bx8eeK0_19PJtdjUxnCcy2lU",
      };

      final uri = Uri.https(APIUrls.baseURL, '/$path', query);
      var response = await httpClient.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return APIResponse.fromJson(data);
      } else if (response.statusCode == 440) {
        throw APIException(message: "Token is invalid.");
      }
      throw APIException();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResponse> post({
    required String path,
    Map<String, String>? query,
    Object? body,
  }) async {
    // TODO: implement post
    try {
      var url = Uri.parse(path);
      var response = await httpClient.post(url, headers: query, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return APIResponse.fromJson(data);
      } else if (response.statusCode == 440) {
        throw APIException(message: "Token is invalid.");
      }
      throw APIException();
    } catch (e) {
      rethrow;
    }
  }
}
