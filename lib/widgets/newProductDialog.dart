import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:medicine_warehouse/controller/newProduct.dart';

class NewProductDialog extends StatefulWidget {
  @override
  _NewProductDialogState createState() => _NewProductDialogState();
}

class _NewProductDialogState extends State<NewProductDialog> {
  final TextEditingController commercialNameController = TextEditingController();
  final TextEditingController scientificNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  String selectedCategory = 'Diabetes';
  
  List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "Diabetes"},
    {"id": 2, "name": "Urinary"},
    {"id": 3, "name": "Digestive"},
    {"id": 4, "name": "Dermal"},
    {"id": 5, "name": "Respiratory"},
    {"id": 6, "name": "Vitamins"},
    {"id": 7, "name": "Alimentary"},
    {"id": 8, "name": "Antibiotics"},
    {"id": 9, "name": "Pressure"},
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Product'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                controller: commercialNameController,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Commercial Name',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: scientificNameController,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Scientific Name',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller:companyNameController ,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Company',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: quantityController,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: expirationDateController,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Expiration date',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
                onTap: (){
                  selectDate(context);
                },
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: priceController,
                cursorColor: kThirdColor,
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(color: kThirdColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kThirdColor),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                DropdownButton<String>(

                  //focusColor: Colors.white,
                  underline: Container(
                    color: kThirdColor,
                    height: 1,
                  ),
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categories
                      .map<DropdownMenuItem<String>>((Map<String, dynamic> category) {
                    return DropdownMenuItem<String>(
                      value: category['name'],
                      child: Text(category['name']),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kThirdColor,
                  ),
                  onPressed: pickImage,
                  child: Text(
                    'Pick Image',
                    style: TextStyle(color: kSecondColor),
                  ),
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
            String commercialName = commercialNameController.text;
            String scientificName = scientificNameController.text;
            String companyName = companyNameController.text;
            String quantity = quantityController.text;
            String price = priceController.text;
            String expirationDate = expirationDateController.text;
            int categoryId = categories
            .firstWhere((category) => category['name'] == selectedCategory)['id'];
            String id = '$categoryId'; 
            String image='';
            Map creating = await createProdcut(scientificName, commercialName, companyName, quantity, price, id, expirationDate, image, acssesToken);
            if(creating['status']==200){
              print('sucssesful');
            }
            else if(creating['status']==422) {
              print (creating['errors']);

            }
            // Add logic to save changes
            Navigator.of(context).pop();
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

Future<void> pickImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    // Do something with the picked image file (file.path).
  } else {
    // User canceled the picker
  }
}
Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      barrierColor: kThirdColor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: kFirstColor, // <-- SEE HERE
            onPrimary: kThirdColor, // <-- SEE HERE
            onSurface: kFourthlyColor, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kThirdColor, // button text color
            ),
          ),
        ),
        child: child!,
      );
    }, 
    );
    if(picked != null){
      setState((){
        expirationDateController.text=picked.toString().split(" ")[0];
      });
    }
  
  }
}

