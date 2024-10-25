import 'package:flutter/material.dart';

import '../constant.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryname ;
  CategoryWidget({required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: kFirstColor.withOpacity(0.6), width: 2),
            ),
            child: Text(
              categoryname,
              style: TextStyle(
                color: kTextThirdColor.withOpacity(0.9),
                fontSize: MediaQuery.of(context).size.width * 0.01,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }}
