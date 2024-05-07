import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/widget/categores.dart';
import 'package:e_commerce_provider/widget/home_app_bar.dart';
import 'package:e_commerce_provider/widget/image_slider.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:e_commerce_provider/widget/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
       int currentSlide=0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(padding: 
        EdgeInsets.all(20),child: 
        Column(
          
          children: [
            SizedBox(height: 30,),
            //for cusstom appbar
            CusttomAppBar(),
            SizedBox(height: 20,),
            //fro search bar
            MySearchBar(),
            SizedBox(height: 20,),
            ImageSlider(
              currentSlide: currentSlide,
              onChange:(value){
              setState(() {
                currentSlide=value;
              });
             },),
             SizedBox(height: 20,),
         
             //for categories
                 Categores(),
                 ///
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                   [ 
                    Text('special for you',style: 
                    TextStyle(fontSize: 25,
                    fontWeight: FontWeight.w800),),
                    Text('see all',style: 
                    TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                    color: Colors.black45),)
                   ],
                 ),
                 //for shoping items
                 GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 20,
                     mainAxisSpacing: 20,
                     childAspectRatio: 0.78
                   ),
                   itemCount: products.length,
                   itemBuilder: (BuildContext context, int index) {
                     return ProductCart(product: products[index]);
                   },
                 ),



  



          ],
        
        ),
        
        ),
      ),
    );
  }
}
