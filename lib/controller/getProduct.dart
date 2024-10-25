import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/models/productResponse.dart';

Future<Product> fetchProduct(int productId, String authToken) async {
  final response = await http.get(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/product/$productId'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    final jsonMap = json.decode(response.body);
    return Product.fromJson(jsonMap['data']); // Assuming 'data' contains the product information
  } else {
    throw Exception('Failed to load product');
  }
}
