import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_provider/model/order_model.dart';

class OrderServices {
  Future<List<Order>> fetchOrdersByUser(String userId) async {
    final response = await http.get(Uri.parse('$kEndpoint/order/user/$userId'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    log('orders: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Order> orders =
          body.map((dynamic item) => Order.fromJson(item)).toList();

      for (var order in orders) {
        for (var product in order.products) {
          log('Product name: ${product.product?.name}');
        }
      }

      // log('Orders after serializations: ${orders[0]}');
      return orders;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<Order> createOrder(Map<String, dynamic> orderData) async {
    final response = await http.post(
      Uri.parse('$kEndpoint/order/create'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(orderData),
    );

    if (response.statusCode == 201) {
      final body = jsonDecode(response.body);
      return Order.fromJson(body);
    } else {
      throw Exception('Failed to create order');
    }
  }
}
