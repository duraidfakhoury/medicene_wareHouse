import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_warehouse/controller/fcm_token.dart';
import 'package:medicine_warehouse/controller/regestraition.dart';
import 'package:medicine_warehouse/pages/homePage.dart';
import '/constant.dart';
import '/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  CustomTextField firstNameField = CustomTextField();
  CustomTextField lastNameField = CustomTextField();
  CustomTextField phoneNumberField = CustomTextField();
  CustomTextField wareHouseNameField = CustomTextField();
  CustomTextField passwordField = CustomTextField();
  CustomTextField warehouseLocationField = CustomTextField();
  dynamic  imagePath = ''; // Variable to store the image path

  RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.00),
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
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Welcome 👋',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Let's Get You Started With [Top pharma]",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.019,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top : 50.0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRow('First Name', context, firstNameField),
                    buildRow('Last Name', context, lastNameField),
                    buildRow('Password', context, passwordField),
                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRow('Mobile Phone', context, phoneNumberField),
                    buildRow('Warehouse Name', context, wareHouseNameField),
                    buildRow('Warehouse Location', context, warehouseLocationField),
                  ],
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                padding: EdgeInsets.only(right: 20.0),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kThirdColor,
                  ),
                  onPressed: () async {
                    try {
                      imagePath = (await pickImage())!;
                    } catch (e) {
                      print('Image picking canceled  $e');
                      return; // Cancel further processing
                    }
                  },
                  child: Text('Pick Image', style: TextStyle(color: kSecondColor,
                    fontSize: MediaQuery.of(context).size.width*0.015,
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kFirstColor,
                    ),
                    onPressed: () async {
                      String firstName = firstNameField.getEnteredText();
                      String lastName = lastNameField.getEnteredText();
                      String MobilePhone = phoneNumberField.getEnteredText();
                      String WarehouseName = wareHouseNameField.getEnteredText();
                      String password = passwordField.getEnteredText();
                      String warehouseLocation = warehouseLocationField.getEnteredText();
              
                      Map registerScsses =
                          await registerUser(MobilePhone, password, firstName, lastName, WarehouseName,warehouseLocation, imagePath);
              
                      if (registerScsses['status'] == 200) {
                        print(registerScsses['token']);
                        //acssesToken=registerScsses['token'];
                        sendToken(deviceToken);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      } else if (registerScsses['status'] == 422) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('register Failed'),
                              content: Text(jsonEncode(registerScsses['errors'])),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the AlertDialog
                                  },
                                  child: Text('OK', style: TextStyle(color: kThirdColor)),
                                ),
                              ],
                            );
                          },
                        );
                        print('failed');
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: kSecondColor,
                        fontSize: MediaQuery.of(context).size.width * 0.015,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRow(String labelText, BuildContext context, CustomTextField textField) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 5.0, bottom: 5),
          child: Text(
            labelText,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5.0, bottom: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.20,
            child: textField,
          ),
        )
      ],
    );
  }
}