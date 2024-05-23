import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white, padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
              )),
          Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white, padding: EdgeInsets.all(20)),
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                size: 20,
              )),
          SizedBox(
            width: 10,
          ),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white, padding: EdgeInsets.all(20)),
              onPressed: () {
                provider.toggleFavorite(product);
              },
              icon: Icon(
                provider.isExist(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 20,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
