import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/models/productResponse.dart';

Future<ApiResponse> fetchProducts(String searchTerm, String category,String authToken) async {
  final response = await http.get(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/products?search=$searchTerm&category=$category'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    //print('done');
    //print(response.body);
    final jsonMap = json.decode(response.body);
    //print(jsonMap);
    
    //print(response.statusCode);
    return ApiResponse.fromJson(jsonMap);
  } else {
    //print(response.statusCode);
    throw Exception('Failed to load products');
  }
}
