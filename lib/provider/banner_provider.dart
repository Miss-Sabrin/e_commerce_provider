import 'dart:developer';

import 'package:e_commerce_provider/model/banner.dart';
import 'package:e_commerce_provider/services/banner.dart';
import 'package:flutter/material.dart';

enum BannerState { normal, loading, error, success, notFound }

class BannerProvider extends ChangeNotifier {
  List<Datum> listOfBanners = [];
  BannerState state = BannerState.normal;

  Future<void> getAllbanners() async {
    try {
      if (listOfBanners.isNotEmpty) return;
      state = BannerState.loading;
      notifyListeners();
      listOfBanners = await BannerService().getBanners();
      state = BannerState.success;
      notifyListeners();
    } catch (e) {
      log("error: $e");
    }
  }
}
