import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/screens/detail/detail.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)));
  }

  void _performSearch(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.searchProducts(query);
  }

  @override
  Widget buildResults(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _performSearch(context);
    });

    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.state == ProductState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.state == ProductState.error) {
          return const Center(child: Text('Error occurred'));
        } else if (provider.searchResults.isEmpty) {
          return const Center(child: Text('No products found'));
        } else {
          return ListView.builder(
            itemCount: provider.searchResults.length,
            itemBuilder: (context, index) {
              var product = provider.searchResults[index];
              return ListTile(
                title: Text(product.name ?? ''),
                subtitle: Text(product.desc ?? ''),
                leading: CachedNetworkImage(
                  imageUrl: product.photos![0],
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _performSearch(context);
    });

    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.state == ProductState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.state == ProductState.error) {
          return const Center(child: Text('Error occurred'));
        } else if (provider.searchResults.isEmpty) {
          return const Center(child: Text('No products found'));
        } else {
          return ListView.builder(
            itemCount: provider.searchResults.length,
            itemBuilder: (context, index) {
              var product = provider.searchResults[index];
              return ListTile(
                title: Text(product.name ?? ''),
                subtitle: Text(product.desc ?? ''),
                leading: CachedNetworkImage(
                  imageUrl: product.photos![0],
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
