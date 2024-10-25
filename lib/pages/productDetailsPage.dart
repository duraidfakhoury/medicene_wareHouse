import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:medicine_warehouse/controller/getProduct.dart';
import 'package:medicine_warehouse/models/productResponse.dart';
import 'package:medicine_warehouse/widgets/drawer.dart';
import '../models/counterManager.dart';
import '../widgets/productEdit.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productID;
  final String authToken;

  const ProductDetailsPage({
    required this.productID,
    required this.authToken,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Future<Product>? productFuture;

  @override
  void initState() {
    super.initState();
    productFuture = fetchProduct(widget.productID, widget.authToken);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CounterManager counterManager = CounterManager();
  bool isFavorite = false;
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Details',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w400,
            color: kSecondColor,
          ),
        ),
      ),
      body: FutureBuilder<Product>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data: ${snapshot.error}'),
            );
          } else {
            final product = snapshot.data;
            if (product == null) {
              return Center(
                child: Text('Product not found'),
              );
            }
             final String baseUrl = "http://alaa-lababidi.point-dev.net";
             final String imagepath = product.image;
            final String imageUrl = '$baseUrl$imagepath';

            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child:  Container(
                        child: Image.network(
                           imageUrl,scale: 0.25,
                           height: MediaQuery.of(context).size.height*0.40,
                            width: MediaQuery.of(context).size.width*0.40,
                             fit: BoxFit.cover,
                             errorBuilder: (context, error, stackTrace) => Image.asset(
                                "imagesone/default-product.jpg",
                                scale: 1.0,
                                height: MediaQuery.of(context).size.height*0.40,
                                width: MediaQuery.of(context).size.width*0.40,
                                fit: BoxFit.cover,
                              ),
                           ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Commercial Name: ${product.commercialName}",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.015,
                                  color: kThirdColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 50,),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                                size: MediaQuery.of(context).size.width * 0.02,
                              ),
                              onPressed: () {
                               
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                          ],
                        ),
                Container(
                  height: 15,
                ),

                Text("Category: ${product.category.name}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.01,
                            color: kFourthlyColor,
                            fontWeight: FontWeight.bold)),
                Container(
                  height: 15,
                ),
                Text(
                  "Company: ${product.companyName}",
                  style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.01,
                          color: kTextThirdColor,
                          fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 15,
                ),
          
                Text("Scientific Name: ${product.scientificName}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.01,
                            color: kTextThirdColor,
                            fontWeight: FontWeight.bold)),
                Container(
                  height: 15,
                ),
                Text("Available Quantity: ${product.quantity}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.01,
                            color: kTextThirdColor,
                            fontWeight: FontWeight.bold)),
                Container(
                  height: 15,
                ),
                Text("Creation Date:${product.createdAt}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.01,
                            color: kTextThirdColor,
                            fontWeight: FontWeight.bold)),
                Container(
                  height: 15,
                ),

                Text(
                  "Expiration Date: ${product.expiration}",
                  style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.01,
                        color: kTextThirdColor,
                        fontWeight: FontWeight.bold,
                  ),
                ),
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
                  Text("Price is per piece:  ${product.price}",
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
                  return ProductEditDialog();
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

            // Container(
            //   height: 15,
            // ),
            // Container(
            //   height: 50,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: kFirstColor,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => CartPage()));
            //     },
            //     child: Center(
            //       child: Text(
            //         "Continue to shopping cart",
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width * 0.015,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
