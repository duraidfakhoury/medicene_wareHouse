import 'package:flutter/material.dart';
import 'package:medicine_warehouse/constant.dart';
import 'package:medicine_warehouse/pages/productDetailsPage.dart';
//import 'dart:io';

class ProductCard1 extends StatefulWidget {
  final int id;
  final String commercialName;
  final int price;
  final String imagePath;
  final String category;

  const ProductCard1({
    Key? key,
    required this.id,
    required this.commercialName,
    required this.price,
    required this.imagePath,
    required this.category,
  }) : super(key: key);

  @override
  State<ProductCard1> createState() => _ProductCard1State();
}

class _ProductCard1State extends State<ProductCard1> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Replace this base URL with your actual API base URL
    final String imageUrl;
    final String baseUrl = "http://alaa-lababidi.point-dev.net";
    if(widget.imagePath=="")
      imageUrl = 'https%3A%2F%2Fdeconova.eu%2Fwp-content%2Fuploads%2F2016%2F02%2Fdefault-placeholder.png&tbnid=A0pMe2lq2NT_jM&vet=12ahUKEwiY4YiL7ryDAxV67QIHHZN1CbkQMygOegQIARBs..i&imgrefurl=https%3A%2F%2Fdeconova.eu%2Fen%2Four-company%2Fhistory%2Fdefault-placeholder-2%2F&docid=7DVFuk8WO0nc0M&w=1500&h=1500&q=default%20picture&ved=2ahUKEwiY4YiL7ryDAxV67QIHHZN1CbkQMygOegQIARBs';

    else{      
    imageUrl = '$baseUrl${widget.imagePath}';}
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kFirstColor, width: 2),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsPage(
              productID: widget.id,
              authToken: acssesToken,
            )),
          );
            },
            child: Container(
              child: Image.network(
                imageUrl,scale: 1.0,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                "imagesone/default-product.jpg",
                scale: 1.0,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(height: 20),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.commercialName,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.012,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0115,
                    fontWeight: FontWeight.w500,
                    color: KFifthcolor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.price} S.P",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.015,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
