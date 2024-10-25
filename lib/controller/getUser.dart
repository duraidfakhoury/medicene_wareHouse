import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/models/userResponse.dart';

Future<userResponse> fetchUser(String authToken) async {
  final response = await http.get(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/user'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    },
  );

  if (response.statusCode == 200) {
    final jsonMap = json.decode(response.body);
    return userResponse.fromJson(jsonMap); // Pass the entire jsonMap
  } else {
    throw Exception('Failed to load user');
  }
}
