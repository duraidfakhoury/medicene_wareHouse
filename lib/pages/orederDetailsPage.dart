//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:medicine_warehouse/widgets/EditOrderDialog.dart';
import 'package:medicine_warehouse/widgets/drawer.dart';

class OrderDetailsPage extends StatefulWidget {
  final Map order;
  final String authToken;

  const OrderDetailsPage({
    required this.order,
    required this.authToken,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   List<dynamic> items = List.empty();
  
  @override
  Widget build(BuildContext context) {
    items = widget.order['order_items'];
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        titleSpacing: 50,
        backgroundColor: kFirstColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 50,
              color: kSecondColor,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            padding: EdgeInsets.zero,
            iconSize: 50,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Order Details',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w400,
            color: kSecondColor,
          ),
        ),
      ),
      body:  Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Text(
                              "Order Party : ${widget.order['user']['name']}",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.015,
                                  color: kThirdColor,
                                  fontWeight: FontWeight.bold),
                            ),
                        Container(
                            height: 15,
                        ),
                        Text(
                        "Oreder Party Phone Number :  ${widget.order['user']['phone_number']}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.01,
                          color: kFirstColor,
                          fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 15,
                        ),
                        Text("Oreder Status :  ${widget.order['status']}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.01,
                            color: kFirstColor,
                            fontWeight: FontWeight.bold)),
                        Container(
                          height: 15,
                        ),
                        Text(
                        "Payment Status :  ${widget.order['payment_status']}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.01,
                          color: kFirstColor,
                          fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.19,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                            return 
                              Row(
                                children: [
                                  Text(
                                      "Commercial name :  ${items[index]['product']['commercial_name'] ?? "n/a"} ",
                                      style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.012,
                                      color: kTextThirdColor,
                                      fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "      Quantity :  ${items[index]['quantity'] ?? "n/a"} ",
                                      style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.012,
                                      color: kTextThirdColor,
                                      fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              );
                              },
                            ),
                         )
                    ],
                    ),
              ],
            ),
                  Container(
              height: MediaQuery.of(context).size.height * 0.29,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: [
                  Text("Total Order Price is : ${widget.order['total_price']}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.015,
                          color: kTextSecondColor,
                          fontWeight: FontWeight.w500)),
                Spacer(),
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
            onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return EditOderDialog(selectedPaiment: '${widget.order['payment_status']}',selectedState: widget.order['status'],orderid: '${widget.order['id']}',);
                },
              );
          
        },
        child: Container(
          decoration: BoxDecoration(
            color: kFirstColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width*0.1,
          height:  MediaQuery.of(context).size.height*0.05,
          child: Center(
            child: Text(
              "Edit ",
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.015, color: kBackgroundColor),
            ),
          ),
        ),
      ),
    )
          

                ],
              ),
            ),

            Divider(
              height: MediaQuery.of(context).size.height * 0.01, 
              thickness: 2, 
              color: Colors.grey, 
                  ),
                ],
              ),
              )
            );
          }
        }
      
