import 'package:e_commerce_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    int index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].units = (_cart[index].units ?? 0) + 1;
    } else {
      product.units = 1;
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cart[index].units = (_cart[index].units ?? 0) + 1;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cart[index].units != null && _cart[index].units! > 1) {
      _cart[index].units = _cart[index].units! - 1;
      notifyListeners();
    }
  }

  double totalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += (element.price ?? 0) * (element.units ?? 1);
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
