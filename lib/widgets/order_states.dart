import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:medicine_warehouse/pages/orederDetailsPage.dart';

class OrderState extends StatefulWidget {
  final dynamic data;
  OrderState({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<OrderState> createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {
  late String selectedState ;
  late String selectedPaiment ;
  List<String> paimentState = ['0','1'];
  List<String> orderStates = ['preparing', 'shipping', 'delivered'];

  @override
  void initState() {
    super.initState();
    selectedState = widget.data['status'];
    selectedPaiment='${widget.data['payment_status']}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildOrderDetailsContainer(widget.data),
        ),
      ],
    );
  }

  Widget buildOrderDetailsContainer(dynamic data) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 178,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: kFirstColor),
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 15,
              child: Text(
                'Order Party : ${data['user']['name']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.w700,
                  height: 0.06,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 55,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 19,
              top: 81,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.phone_callback),
                    Container(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '  ${data['user']['phone_number']}',
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 16,
                          fontFamily: 'Overpass',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 450,
              top: 65,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(1.57),
                child: Container(
                  width: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: kFirstColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 465,
              top: 81,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.monetization_on),
                    Container(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        ' ${data['total_price']} S.P',
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 16,
                          fontFamily: 'Overpass',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 900,
              top: 65,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(1.57),
                child: Container(
                  width: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: kFirstColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 915,
              left: 65,
              child: Text(
                '${data['created_at']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.w700,
                  height: 0.06,
                ),
              ),
            ),
            Positioned(
              left: -3,
              top: 125,
              child: buildOrderStateContainer(),
            ),
          ],
        ),
      ),
      onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => OrderDetailsPage(
              order: data,
              authToken: acssesToken,
            )));
            },
    );
  }

  Widget buildOrderStateContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 53,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: kThirdColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: kFirstColor),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top : 8.0),
            child: Text(
              '$selectedState',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Overpass',
                fontWeight: FontWeight.w500,
                height: 0.05,
              ),
            ),
          ),
          Container(width: 10),
          Icon(Icons.rotate_right, color: kFourthlyColor),
          Container(width: 350,),
          Padding(
            padding: const EdgeInsets.only(top : 8.0),
            child: Text(
              '$selectedPaiment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Overpass',
                fontWeight: FontWeight.w500,
                height: 0.05,
              ),
            ),
          ),
          Container(width: 10),
          Icon(Icons.monetization_on, color: kFourthlyColor),
        ],
      ),
    );
  }
}
