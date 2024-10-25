import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:medicine_warehouse/constant.dart';
//import 'package:medicine_warehouse/models/orederResponse.dart';
//import 'package:medicine_warehouse/models/orederResponse.dart';
//import 'order_models.dart';  // Import your Dart models

Future<List<dynamic>> fetchOrders(String authToken) async {
  final response = await http.get(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/orders'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    // print(acssesToken);
    final jsonMap = json.decode(response.body);
    
    return jsonMap['data'];
  } else {
    print(response.statusCode);
    throw Exception('Failed to load orders');
  }
}
