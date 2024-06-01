import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/widget/card_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryViewPage extends StatelessWidget {
  final String pageTitle;
  const CategoryViewPage({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: productProvider.state == ProductState.loading
          ? const Center(child: CircularProgressIndicator())
          : productProvider.state == ProductState.error
              ? const Center(child: Text("Error fetching products"))
              : productProvider.products.isEmpty
                  ? const Center(
                      child: Text('No Products in this category'),
                    )
                  : Center(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: productProvider.productsByCategory.length,
                          itemBuilder: (context, index) {
                            var product =
                                productProvider.productsByCategory[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: InkWell(
                                onTap: () {},
                                child: CarUICard(product: product),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
    );
  }
}
