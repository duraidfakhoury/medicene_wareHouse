import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginUser(String phone_number, String password) async {
  final response = await http.post(
    Uri.parse('http://alaa-lababidi.point-dev.net/api/login'),
    headers: {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json',
    },
    body: {
      'phone_number': phone_number,
      'password': password,
      'role': 'warehouse_owner',
    },
  );

  if (response.statusCode == 200) {
    // Login successful, return the response body
    return json.decode(response.body);
  } else {
    // Login failed, return an empty map
    print('Login failed. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return {};
  }
}

