import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
          log("Mapping product: $e");
          return Product.fromJson(e);
        }).toList();

        log("Parsed products: $products");
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

  Future<Product> getProductById(String id) async {
    var response = await http.get(
      Uri.parse("$kEndpoint/products/$id"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    log("Response status: ${response.statusCode}");
    log("Response body: ${response.body}");

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
