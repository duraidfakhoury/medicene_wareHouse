import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String,dynamic>> fetchWarehouse(String authToken, String warehouseId) async {
  String url = 'http://alaa-lababidi.point-dev.net/api/warehouse/$warehouseId';
  //print('URL: $url');
  //print('AuthToken: $authToken');

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    final dynamic jsonMap = json.decode(response.body);

    if (jsonMap == null) {
      // Handle the case where the JSON is null
      throw Exception('Failed to decode JSON. Response body is null.');
    }

    else {
      if(jsonMap['status']==200)
          return jsonMap['data'];
      else {
        throw 'Warehouse details failed. Status code: ${jsonMap['status']}';
      }
    }
  } else {
    // Log details for failed request
    print('Warehouse details failed. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    
    // Throw a specific exception based on your error handling logic
    throw Exception('Failed to load warehouse. Status code: ${response.statusCode}');
  }
}
