import 'package:flutter/material.dart';
import 'package:gharelu/common/apicalls/requestProductAPI.dart';
import 'dart:async';
import 'package:gharelu/model/productModel.dart';
import 'package:gharelu/ui/productDetailScreen.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future<Product> product;
  Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    product = fetchProduct(2);
    products = fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: products,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return _buildProductList(snapshot.data);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildProductList(List<Product> productList) {
    return Container(
      height: 250.0,
      color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList == null ? 0 : productList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItem(productList[index]);
        },
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      product: product,
                    )));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              product.image,
              scale: 0.2,
              height: 200.0,
            ),
            Text(product.name),
            Text('Rs. ${product.price}'),
          ],
        ),
      ),
    );
  }
}
