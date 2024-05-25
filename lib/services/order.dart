import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_provider/model/order_model.dart';

class OrderServices {
  // Future<void> createOrder(Order order) async {
  //   try {
  //     var response = await http.patch(
  //       Uri.parse('$kEndpoint/order/create'),
  //       headers: {HttpHeaders.contentTypeHeader: "application/json"},
  //       body: orderToJson(order),
  //     );

  //     if (response.statusCode == 200) {
  //       log("Order created successfully: ${response.body}");
  //     } else {
  //       log("Failed to create order: ${response.body}");
  //       throw "Failed to create order";
  //     }
  //   } catch (e) {
  //     log("Error creating order: $e");
  //     rethrow;
  //   }
  // }

  Future<List<Order>> getOrderByUser(String userId) async {
    try {
      var response = await http.get(
        Uri.parse('$kEndpoint/order/user/$userId'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

      // log("Status code: ${response.statusCode}");
      // log("Orders Response: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        log('Orders Decoded: $json');
        List<Order> orders = json.map((e) {
          // log('Order JSON: $e');
          return Order.fromJson(e);
        }).toList();
        return orders;
      } else {
        throw "Failed to load orders";
      }
    } catch (e) {
      log("Error fetching orders: $e");
      rethrow;
    }
  }
}
