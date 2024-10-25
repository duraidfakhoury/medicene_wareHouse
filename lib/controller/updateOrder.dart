import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/constant.dart';


Future<void> UpdateOrder (String orderid,String status,String payment_status) async {
  var response = await http.post(Uri.parse("http://alaa-lababidi.point-dev.net/api/order/${orderid}/update"),
  headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $acssesToken',
  },
  body: {
    'status':status,
    'payment_status':payment_status
    }
  );
  if(response.statusCode==200){
    print('done');
      final jsonMap = json.decode(response.body);
      if(jsonMap['status']==200){
        print('done');
      }
      else {
        print(jsonMap['status']);
      }
  }
}