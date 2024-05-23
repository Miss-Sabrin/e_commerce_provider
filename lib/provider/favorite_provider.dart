import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoriteProvider extends ChangeNotifier{
  final List <Product> _favorite=[];
  List<Product> get favorite=>_favorite;

  void toggleFavorite(Product product){
    if(_favorite.contains(product)){
      favorite.remove(product);
      
    }else{
      _favorite.add(product);
    }
    notifyListeners();
  }

bool isExist(Product product){
  final isExist=favorite.contains(product);
  return isExist;
}


  static FavoriteProvider of(
    BuildContext context,{
      bool listen=true,
    }){
      return Provider.of<FavoriteProvider>(
        context,
        listen: listen
      );
    }
  
   
}