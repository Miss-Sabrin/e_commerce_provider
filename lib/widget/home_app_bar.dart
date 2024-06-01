import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/cart/cart.dart';
import 'package:e_commerce_provider/screens/profile/profile.dart';
import 'package:e_commerce_provider/utils/Delegates/custom_search.dart';
import 'package:e_commerce_provider/widget/search_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CusttomAppBar extends StatelessWidget {
  const CusttomAppBar({
    super.key,
  });

  void _showSearchBar(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Consumer<UserProvider>(builder: (context, cont, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                      title: Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kRichBlackColor),
                      ),
                      subtitle: Text(
                        cont.user.name ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade500, fontSize: 15),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: 
                              // cont.user.photo ??
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      trailing: Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return badges.Badge(
                            position: BadgePosition.topEnd(top: -1, end: 1),
                            badgeContent: Text(
                              cartProvider.cart.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: kMinCreamColor),
                            ),
                            badgeAnimation: const badges.BadgeAnimation.fade(),
                            showBadge:
                                cartProvider.cart.isNotEmpty ? true : false,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const CartScreen()),
                                );
                              },
                              icon: const Icon(
                                FontAwesomeIcons.store,
                                size: 20,
                              ),
                            ),
                          );
                        },
                      )),
                )
              ],
            ),
            SearchPlaceholder(
              searchItemRouter: () => _showSearchBar(context),
              placeHolderTxt: 'Search products',
            )
          ],
        );
      }),
    );
  }
}
