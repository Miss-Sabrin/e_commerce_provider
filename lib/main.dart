import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/provider/category_provider.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/form/sing_in.dart';
import 'package:e_commerce_provider/screens/home/home.dart';
import 'package:e_commerce_provider/screens/nav_botton.dart';
import 'package:e_commerce_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  final box = GetStorage();
  bool isLogin = box.hasData(kUserInfo);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartPeovider(),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        home: isLogin ? const BottomNvbar() : const LoginScreen(),
      ),
    ),
  );
  // DevicePreview(
  // enabled: !kReleaseMode,

  // builder: (context) =>  MyApp(),
  // )
  //);
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (_) => CartPeovider(),
//           ),
//           ChangeNotifierProvider(create: (_) => FavoriteProvider()),
//           ChangeNotifierProvider(create: (_) => UserProvider()),
//           ChangeNotifierProvider(create: (_) => ProductProvider()),
//           ChangeNotifierProvider(create: (_) => CategoryProvider()),
//           ChangeNotifierProvider(create: (_) => OrderProvider()),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             textTheme: GoogleFonts.mulishTextTheme(),
//           ),
//           home: isLogin ? const BottomNvbar() : SignInPage(),
//         ),
//       );
// }
