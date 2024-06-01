import 'package:e_commerce_provider/provider/banner_provider.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/provider/category_provider.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/provider/navigation_provider.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/payment_provider.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/form/sing_in.dart';
import 'package:e_commerce_provider/screens/home/home.dart';
import 'package:e_commerce_provider/screens/bottom_navigations.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/screens/on_boarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  final box = GetStorage();
  bool isLogin = box.hasData(kUserInfo);
  bool hasSeenOnboarding = box.read('hasSeenOnboarding') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        home: isLogin
            ? const IntroScreen()
            : hasSeenOnboarding
                ? const LoginScreen()
                : const IntroScreen(),
        routes: {
          'login': (context) => const LoginScreen(),
          'home': (context) => const Home(),
        },
      ),
    ),
  );
}
