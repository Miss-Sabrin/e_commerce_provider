import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_provider/model/Payment.dart';

class PaymentServices {
  Future<List<PaymentModel>> getAllPayments() async {
    var response = await http.get(
      Uri.parse('$kEndpoint/payment'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      List<PaymentModel> payments =
          json.map((e) => PaymentModel.fromJson(e)).toList();
      return payments;
    } else {
      throw "Failed to fetch payments";
    }
  }
}
