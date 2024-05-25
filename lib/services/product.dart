import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/model/category.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future<List<Product>> getAllProducts() async {
    var response = await http.get(
      Uri.parse("$kEndpoint/product"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    // log("Response status: ${response.statusCode}");
    // log("Response body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> productsJson = json["products"];

        // log("Decoded JSON: $productsJson");

        List<Product> products = productsJson.map((e) {
          // log("Mapping product: $e");
          return Product.fromJson(e);
        }).toList();

        // log("Parsed products: $products");
        return products;
      } catch (e, stacktrace) {
        log("Error parsing JSON: $e");
        log("Stacktrace: $stacktrace");
        throw "Error parsing product data";
      }
    } else {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        throw json["error"];
      } catch (e) {
        throw "Unknown error occurred";
      }
    }
  }

  // ?: By category

  Future<List<Product>> fetchProductsByCategories(String categoryId) async {
    try {
      var url = Uri.parse("$kEndpoint/product/category/$categoryId");
      var response = await http.get(url, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as Map<String, dynamic>;
        var products = (data['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
        return products;
      } 
      else if(response.statusCode == 404){
        throw Exception('No Data Found $categoryId'); 
      }

      else {
        throw Exception('Failed to load products for category $categoryId');
      }
    } catch (e) {
      print('Error fetching products for category $categoryId: $e');
      rethrow;
    }
  }

  Future<Product> getProductById(String id) async {
    var response = await http.get(
      Uri.parse("$kEndpoint/products/$id"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    // log("Response status: ${response.statusCode}");
    // log("Response body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Product.fromJson(json);
      } catch (e, stacktrace) {
        log("Error parsing JSON: $e");
        log("Stacktrace: $stacktrace");
        throw "Error parsing product data";
      }
    } else {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        throw json["error"];
      } catch (e) {
        throw "Unknown error occurred";
      }
    }
  }
}
