
import 'package:http/http.dart' as http;
import 'package:medicine_warehouse/constant.dart';


Future<void> sendToken(String fcm_token)async{
  print("got there");
  var reseponse = await http.post(Uri.parse('http://alaa-lababidi.point-dev.net/api/user/fcm_token_edit'),
  headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $acssesToken',
      // 'Content-Type': 'application/json',
    },
    body: {
      'fcm_token': fcm_token,
    },
  );
  if(reseponse.statusCode == 200)
    print('${reseponse.body}');
  else 
   print(reseponse.body);
}