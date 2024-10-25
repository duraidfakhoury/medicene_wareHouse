
import 'package:flutter/material.dart';
import 'package:medicine_warehouse/pages/homePage.dart';
// import '/pages/chooseWarehouse.dart';
import '../constant.dart';
//import '../pages/registerPage.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.40),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: kFirstColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.015, color: kBackgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
