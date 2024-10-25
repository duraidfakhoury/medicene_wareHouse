import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kThirdColor,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kThirdColor, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 245, 244, 251),
      ),
    );
  }

  String getEnteredText() {
    return controller.text;
  }
}
