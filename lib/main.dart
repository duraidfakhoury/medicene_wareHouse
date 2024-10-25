import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_warehouse/firebase_options.dart';
import '/constant.dart';
import 'pages/loginPage.dart';

Future<void> main()  async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

  print('User granted permission: ${settings.authorizationStatus}');

  String? token = await messaging.getToken(
  vapidKey: "BJsfvv3By1pNdgjMROUtQacVSOx8k8P3u5jpzEmaat7L8xfAd_rl-UCtDjMfbMpwoyVC8yS1HS0jcL0zOtgRtEQ",
  );
  deviceToken=token!;
  print("token   $token");
   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.notification?.title}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  catch(eror)
  {
    print('$eror');
  }
   runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medicine_warehouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
              backgroundColor: kTextThirdColor,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: kFirstColor))),

      // routes: {
      // //  "/":(context) => HomePage(),
      //   "cartPage":(context) => CartPage(),
      //   //"/":(context) => HomePage(),
      // },
      home: LoginPage(),
    );
  }
}
