import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

List<dynamic> jsonData = [];
List<dynamic> refValues = [];
List<dynamic> cleanedRefValues = [];

class ApiServices {
  Future<void> fetchData() async {
    final String projectId = 'pfjvqqcl';
    final String dataset = 'production';
    final String apiUrl = 'https://kq4riuh0.api.sanity.io/v1/data/query/';
    final String apiToken =
        'YOUR_API_TOKEN'; 

    final String endpointUrl =
        '$apiUrl/production?query=*%5B_type+%3D%3D+%27more%27%5D'; // Replace 'your-data-type' with the name of your Sanity data type

    final response = await http.get(
      Uri.parse(endpointUrl),
      // headers: {
      //   'Authorization': 'Bearer $apiToken', // Include API token in Authorization header if required
      // },
    );

    if (response.statusCode == 200) {
      // Parse JSON response
      //  jsonData = json.decode(response.body)['result'][0];

      print("checking : $jsonData");

      Map<String, dynamic> parsedJson = json.decode(response.body);

      List<dynamic> legalObject = parsedJson['result'][0]['legalObject'];

      print(legalObject);
      List<dynamic> refValues = legalObject.map((legalObject) {
        if (legalObject is Map<String, dynamic> &&
            legalObject.containsKey('nextIcon')) {
          return legalObject['nextIcon']['asset']['_ref'];
        }
        return null;
      }).toList();

      cleanedRefValues = refValues.map((ref) {
        return ref
            .replaceAll(
                "image-", "https://cdn.sanity.io/images/kq4riuh0/production/")
            .replaceAll("-png", ".png");
      }).toList();

      print(cleanedRefValues);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
