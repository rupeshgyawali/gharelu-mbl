import 'dart:async';
import 'dart:convert';
import 'package:gharelu/resources.dart';
import 'package:http/http.dart' as http;

import 'package:gharelu/model/productModel.dart';

Future<Product> fetchProduct(int id) async{
  final url = productAPIUrl + id.toString();

  final response = await http.get(url);
  print(response.statusCode);
  if(response.statusCode == 200){
    final responseJson = json.decode(response.body);
    
    return Product.fromJson(responseJson);
  }else{

    return null;
  }
}

Future<List<Product>> fetchProductList() async{
  final url = productAPIUrl;
  List<Product> products= [];

  final response = await http.get(url);
  if(response.statusCode == 200){
    final responseJson = json.decode(response.body);
    for (var i=0; i<responseJson.length; i++){
      products.add(Product.fromJson(responseJson[i]));
    }
    return products;
  }

  return [];
}