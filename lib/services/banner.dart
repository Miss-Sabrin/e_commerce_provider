import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_provider/model/banner.dart';

class BannerService {
  Future<List<Datum>> getBanners() async {
    var response = await http.get(
      Uri.parse("$kEndpoint/banner"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    // log('Banner Response: ${response.body}');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> body = json['data'];
      List<Datum> banners =
          body.map((dynamic item) => Datum.fromJson(item)).toList();
      // List<BannerModel> banners =
      //     body.map((dynamic item) => BannerModel.fromJson(item)).toList();
      for (Datum banner in banners) {
        log('Banner Name: ${banner.name}');
      }
      return banners;
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
