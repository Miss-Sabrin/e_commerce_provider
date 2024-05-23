import 'dart:developer';

import 'package:e_commerce_provider/model/category.dart';
import 'package:e_commerce_provider/services/category.dart';
import 'package:flutter/material.dart';

enum CategoryState { normal, loading, error, success }

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  CategoryState state = CategoryState.normal;

  Future<void> fetchAllCategories() async {
    try {
      state = CategoryState.loading;
      notifyListeners();
      var cats = await CategoryServices().getAllCategories();
      categories = cats;
      state = CategoryState.success;
      log('All Categories: ${categories.length}');
      notifyListeners();
    } catch (e) {
      state = CategoryState.error;
      notifyListeners();
    }
  }
}
