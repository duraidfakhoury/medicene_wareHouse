import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:medicine_warehouse/controller/updateOrder.dart';
import 'package:medicine_warehouse/pages/trackingPage.dart';

// ignore: must_be_immutable
class EditOderDialog extends StatefulWidget {
  String selectedState ;
  String selectedPaiment ;
  String orderid ; 

  EditOderDialog({required this.selectedPaiment,required this.selectedState,required this.orderid});
  @override
  _EditOderDialogState createState() => _EditOderDialogState();
}

class _EditOderDialogState extends State<EditOderDialog> {
  late String selectedState ;
  late String selectedPaiment ;
  List<String> paimentState = ['0','1'];
  List<String> orderStates = ['preparing', 'shipping', 'delivered'];

  void initState() {
    super.initState();
    selectedState = widget.selectedState;
    selectedPaiment = widget.selectedPaiment;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Oreder States'),
      content: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              children: [
                DropdownButton<String>(
              underline: Container(color: kThirdColor,
              height: 1,),
              value: selectedPaiment,
              onChanged: (newValue) {
                setState(() {
                  selectedPaiment = newValue!;
                });
              },
              items: paimentState.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(width: 30,),
            DropdownButton<String>(
              underline: Container(color: kThirdColor,
              height: 1,),
              value: selectedState,
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue!;
                });
              },
              items: orderStates.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
              ],
            )
            // Add more form fields as needed
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kFirstColor,
          ),
          onPressed: () async {
            UpdateOrder(widget.orderid , selectedState, selectedPaiment);
            // Add logic to save changes
            Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage()));
          },
          child: Text(
            'Save',
            style: TextStyle(color: kSecondColor),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kFirstColor,
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