import 'package:flutter/material.dart';
import 'package:medicine_warehouse/controller/getWarehouse.dart';
import '../constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> warehouseData;

  @override
  void initState() {
    super.initState();
    warehouseData = fetchWarehouse(acssesToken, warehouseId);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body:FutureBuilder<Map<String, dynamic>>(
        future: warehouseData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No warehouse data available'));
          } else {
            // Warehouse data has been successfully fetched
            Map<String, dynamic> data = snapshot.data!; 
            //Map<String, dynamic> ownerData = data['warehouseowner'];
            return Column(children: [
            Container(
            width: MediaQuery.sizeOf(context).width * 1,
        height:  MediaQuery.sizeOf(context).height * 0.15,
        decoration: BoxDecoration(color: kFirstColor),
        child: Stack(
          children: [
            Positioned(
              left: 50,
              top: 60,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your profile',
                      style: TextStyle(
                        color: kSecondColor,
                        fontSize: MediaQuery.of(context).size.width*0.02,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 0.03,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 40,
      ),
      CircleAvatar(
        radius: 100,
        backgroundColor: kSecondColor,
        backgroundImage: NetworkImage("http://alaa-lababidi.point-dev.net${data['image']}"),
      ),
      Container(
        height: 60,
      ),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(width: MediaQuery.of(context).size.width*0.2,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              buildRow("Warehouse Name", data['name']),
              buildRow("Owner Name", data['warehouse_owner']['name']),
              buildRow("Phone Number", data['warehouse_owner']['phone_number']),
            ],
          ),
          Container(width: MediaQuery.of(context).size.width*0.2,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRow("Warehouse Location", data['location']),
              buildRow("", ""),
              buildRow("", ""),
            ],
          ),
        ],
      ),
      Container(
        height: 85,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width * 0.4,
              decoration: BoxDecoration(
                color: kFirstColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Icon(
                      Icons.logout_outlined,
                      color: kBackgroundColor,
                    ),
                    Text(
                      "  LogOut",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.015,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
         
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            color: kFirstColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.language_outlined,
                  color: kBackgroundColor,
                  size: 22,
                ),
                Text(
                  " Convert to AR ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.015,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
  Widget buildRow(String fildName,String actualData ) {
    return Container(
      padding: EdgeInsets.only(left:80,bottom: 10,top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fildName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    actualData,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w300,
                      height: 1,
                    ),
                  ),
                ],
              ),
            );
  }
}
