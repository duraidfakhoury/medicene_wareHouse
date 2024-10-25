import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/models/productResponse.dart';

Future<ApiResponse> fetchCategories(String authToken) async {
  final response = await http.get(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/api/categories'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    //print('done');
    //print(response.body);
    final jsonMap = json.decode(response.body);
    // print(jsonMap);
    return ApiResponse.fromJson(jsonMap);
  } else {
    throw Exception('Failed to load products');
  }
}