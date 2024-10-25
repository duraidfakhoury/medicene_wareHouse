import 'package:flutter/material.dart';
import 'package:medicine_warehouse/controller/authentication.dart';
import 'package:medicine_warehouse/controller/fcm_token.dart';
import 'package:medicine_warehouse/pages/homePage.dart';
import 'package:medicine_warehouse/pages/registerPage.dart';
import '/constant.dart';
import '/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  String phone_number = '';
  String password = ''; 
  CustomTextField phoneTextField = CustomTextField();
  CustomTextField passwordTextField = CustomTextField();
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.00),
        child: AppBar(
          backgroundColor: kTextThirdColor,
          elevation: 0,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 1,
              color: kFirstColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome 👋',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 15.0, bottom: 15),
                      child: Text(
                        'Phone number',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 15.0, bottom: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: phoneTextField,
                        
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 15.0, bottom: 0),
                      child: Text(
                        'Password ',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5, top: 15.0, bottom: 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: passwordTextField,
                        
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.005,
          // ),
          Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.40),          
          width: MediaQuery.of(context).size.width * 0.02,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kFirstColor,
              foregroundColor: kSecondColor
            ),
          onPressed: () async {
          // Get entered text from text fields
           String phoneNumber = phoneTextField.getEnteredText();
          String enteredPassword = passwordTextField.getEnteredText();
          // Call loginUser function
           Map loginSuccess = await loginUser(phoneNumber, enteredPassword);
          //  bool loginSuccess = true ; 
          // Check if login was successful before navigating
          if (loginSuccess['status']==200) {
            acssesToken = loginSuccess['token'];
            sendToken(deviceToken);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (loginSuccess['status']==401){
        // Show AlertDialog for failed login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text(loginSuccess['message']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the AlertDialog
                  },
                  child: Text('OK',style: TextStyle(color: kThirdColor),),
                ),
              ],
            );
          },
        );
      }
    },
    child: Text('Log In',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.015,),),
  ),
)
,
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width * 0.010,
                    color: kTextThirdColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    ' Register',
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width * 0.01,
                      color: kThirdColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
