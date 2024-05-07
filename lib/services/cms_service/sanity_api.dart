import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiServices {




Future<void> fetchData() async {
  final String projectId = 'pfjvqqcl';
  final String dataset = 'production';
  final String apiUrl = 'https://$projectId.api.sanity.io/v1/data/$dataset';
  final String apiToken = 'YOUR_API_TOKEN'; // Optional: Include API token if required

  final String endpointUrl = '$apiUrl/your-data-type'; // Replace 'your-data-type' with the name of your Sanity data type

  final response = await http.get(
    Uri.parse(endpointUrl),
    headers: {
      'Authorization': 'Bearer $apiToken', // Include API token in Authorization header if required
    },
  );

  if (response.statusCode == 200) {
    // Parse JSON response
    List<dynamic> jsonData = json.decode(response.body);
    // Process and use the fetched data as needed
  } else {
    throw Exception('Failed to load data');
  }
}







}