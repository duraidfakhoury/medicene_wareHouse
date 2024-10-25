import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';

class ProductEditDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Product'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Add your form fields or content here
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Product Name',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Category',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 8.0),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Company',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Quantity',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )      
            
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 8.0),
              child: TextField(
              cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Production Date',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 8.0),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Expiration date',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 8.0),
              child: TextField(
                cursorColor: kThirdColor,
                decoration: InputDecoration(
               labelText: 'Price',
                  labelStyle: TextStyle(color: kThirdColor), // Change label color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),)
                    )
              ),
            ),
            // Add more form fields as needed
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kFirstColor
          ),
          onPressed: () {
            // Add logic to save changes
            Navigator.of(context).pop();
          },
          child: Text('Save', style: TextStyle(color: kSecondColor),),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kFirstColor
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
