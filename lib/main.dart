import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/screens/nav_botton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>CartPeovider(),),
      ChangeNotifierProvider(create: (_)=>FavoriteProvider())

    ],
  
  
    child:  MaterialApp
    (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        
        
      ),
      home: BottomNvbar(),
    ),
  );
  
}