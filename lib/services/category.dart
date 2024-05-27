import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/model/category.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  Future<List<Category>> getAllCategories() async {
    var response = await http.get(
      Uri.parse("$kEndpoint/category"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    // log("Response status: ${response.statusCode}");
    // log("Response body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final List<dynamic> json = jsonDecode(response.body);
        List<Category> categories =
            json.map((e) => Category.fromJson(e)).toList();
        return categories;
      } catch (e, stacktrace) {
        log("Error parsing JSON: $e");
        log("Stacktrace: $stacktrace");
        throw "Error parsing category data";
      }
    } else {
      throw "Failed to load categories";
    }
  }
}
