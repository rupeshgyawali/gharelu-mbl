import 'package:flutter/material.dart';
import 'package:gharelu/model/productModel.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.network(widget.product.image)
            ),
          ],
        ),
      ),
    );
  }
}