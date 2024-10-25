import 'package:flutter/material.dart';
import 'package:medicine_warehouse/controller/getOrders.dart';
//import 'package:medicine_warehouse/models/orederResponse.dart';
import 'package:medicine_warehouse/widgets/drawer.dart';
import 'package:medicine_warehouse/widgets/order_states.dart';
import '../constant.dart';
  // Adjust the path accordingly

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Use dynamic for now, you may want to update this based on the structure of your OrderResponse


late Future<List<dynamic>> orders;

  @override
  void initState() {
    super.initState();
    orders = fetchOrders(acssesToken,);

  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: FutureBuilder<List<dynamic>>(
        future: orders,
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }  else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Row(
                children: [
                   IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 50,
                      color: kFourthlyColor,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    padding: EdgeInsets.zero,
                    iconSize: 50,
                  ),
                  SizedBox(width: 50,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top : 15.0),
                      child: Text(
                        'Order states',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: 'Overpass',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 37,
                    height: 35.36,
                    decoration: ShapeDecoration(
                      color: kFourthlyColor,
                      shape: OvalBorder(),
                    ),
                    child: IconButton(
                          icon: Icon(
                            Icons.loop_outlined,
                            size: 35,
                            color: kBackgroundColor,
                                ),
                          onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => TrackingPage()));
                          },
                          padding: EdgeInsets.zero,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
                //width: 375,
                height: 46,
                decoration: BoxDecoration(color: Color.fromARGB(255, 236, 226, 226)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Overpass',
                        fontWeight: FontWeight.w500,
                        height: 0.04,
                      ),
                    ),
                  ),
                )),
                Container(
                height: 10,
              ),
              Center(
                child: Text('The Warehouse Have No Orders To Display',
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02),
                ),
              )
            ]
          );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> data = snapshot.data!;
          return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Row(
                children: [
                   IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 50,
                      color: kFourthlyColor,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    padding: EdgeInsets.zero,
                    iconSize: 50,
                  ),
                  SizedBox(width: 50,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top : 15.0),
                      child: Text(
                        'Order states',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: 'Overpass',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 37,
                    height: 35.36,
                    decoration: ShapeDecoration(
                      color: kFourthlyColor,
                      shape: OvalBorder(),
                    ),
                    child: IconButton(
                          icon: Icon(
                            Icons.loop_outlined,
                            size: 35,
                            color: kBackgroundColor,
                                ),
                          onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => TrackingPage()));
                          },
                          padding: EdgeInsets.zero,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
                //width: 375,
                height: 46,
                decoration: BoxDecoration(color: Color.fromARGB(255, 236, 226, 226)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Overpass',
                        fontWeight: FontWeight.w500,
                        height: 0.04,
                      ),
                    ),
                  ),
                )),
            Container(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                  //  print(data[index]['id']);
                  // Use data[index] to access each order's information
                  return OrderState(data:data[index],); // Replace this with your widget that displays order information
                },
                 itemCount: data.length,
                 ),
            ),
          ],
         );
          }
        }
       ),
    );
  }
}
