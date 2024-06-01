import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/model/banner.dart';
import 'package:e_commerce_provider/provider/banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CusttomBanner extends StatefulWidget {
  @override
  _CusttomBannerState createState() => _CusttomBannerState();
}

class _CusttomBannerState extends State<CusttomBanner> {
  final CarouselController buttonCarouselController = CarouselController();
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    double bannerSize = MediaQuery.of(context).size.height * 0.20;

    return Consumer<BannerProvider>(builder: (context, bannerProvider, child) {
      if (bannerProvider.state == BannerState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (bannerProvider.state == BannerState.error) {
        return const Center(
          child: Text('No Banners are available!'),
        );
      }

      List<Datum> banners = bannerProvider.listOfBanners;

      return Stack(
        children: [
          SizedBox(
            height: bannerSize,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: bannerSize,
                aspectRatio: 16 / 9,
                viewportFraction: 0.99, // Set to 0.9 for 90% width
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false, // Set to false to avoid enlarging
                onPageChanged: (index, reason) {
                  setState(() {
                    currentSlide = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: banners.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.99,
                      height: bannerSize,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            kprimarayColor,
                            Colors.orange.shade100,
                            kcontentColor,
                          ],
                          stops: const [0.70, 1.0, 1.0],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          // transform: GradientRotation(6.5)
                          // tileMode: TileMode.mirror,
                        ),
                      ), // Adjusted color
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            right: 10,
                            top: 12,
                            child: CachedNetworkImage(
                              imageUrl: i.productId!.photos![0],
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.contain,
                              height: 150,
                              width: 150,
                              // width: MediaQuery.of(context).size.width * 0.9,
                            ),
                          ),
                          Positioned(
                              left: 30,
                              top: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      i.desc!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: kcontentColor,
                                              fontSize: 16,
                                              overflow: TextOverflow.clip),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Gap(10),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    alignment: Alignment.bottomLeft,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.center,
                                          backgroundColor: kcontentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Shop Now',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: kprimarayColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  banners.length, // Change to dynamic length
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentSlide == index ? 20 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentSlide == index ? Colors.black : Colors.grey,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
