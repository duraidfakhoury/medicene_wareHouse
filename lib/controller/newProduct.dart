import 'dart:async';
import 'dart:convert';
//import 'dart:ffi';
//import 'dart:typed_data';
//import 'dart:io';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

Future<Map<String, dynamic>> createProdcut(
 String scientific_name,
 String commercial_name,
 String company_name,
 String quantity,
 String price,
 String category_id,
 String expiration,
 dynamic image,
 String authToken
) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://alaa-lababidi.point-dev.net/api/product/create'),
  );
  request.headers['Accept']= 'application/json';
  request.headers['Authorization']= 'Bearer $authToken';
  
  // Add text fields
  request.fields['scientific_name'] = scientific_name;
  request.fields['commercial_name'] = commercial_name;
  request.fields['company_name'] = company_name;
  request.fields['quantity'] = quantity ;
  request.fields['price'] = price;
  request.fields['category_id'] = category_id;
  request.fields['expiration'] = expiration;
  //request.fields['image'] = image;

  // Add image file
  // if (image.isNotEmpty) {
  //   Uint8List imageBytes = await File(image).readAsBytes();
  //   List<int> list = imageBytes.cast();
  //   request.files.add(http.MultipartFile.fromBytes('image', list));
  // }

  try {
    final response = await request.send();

    if (response.statusCode == 200) {
      // Registration successful, handle the response
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);
      //final token = jsonData['token'];
      //print('Registration successful. Token: $token');
      return {'status': jsonData['status'], 'message': jsonData['message'],'errors':jsonData['errors']};
    } else {
      // Handle registration failure
      print('Creating failed. Status code: ${response.statusCode}');
      return {'status': response.statusCode, 'message': 'Registration failed'};
    }
  } catch (error) {
    print('Error during registration: $error');
    return {'status': 500, 'message': 'Internal Server Error'};
  }
}

Future<String?> pickImage() async {
  try {
    final image = await ImagePickerPlugin().getImageFromSource(source: ImageSource.gallery);
    if (image != null && image.path.isNotEmpty == true) {
      // Use the image path as needed
      print('Picked image path: ${image.path}');
      return image.path;
    } else {
      // User canceled the picker or image path is empty
      print('Image picking canceled or empty path');
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    // Handle the error as needed
    return null;
  }
}



