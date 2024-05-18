import 'package:e_commerce_provider/model/category_model.dart';
import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/widget/home_app_bar.dart';
import 'package:e_commerce_provider/widget/image_slider.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int currentSlide=0;
   int selecetIndex=0;
  @override
  Widget build(BuildContext context) {
    List<List<ProductModel>> selectedCategories=[
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion

    ];
      

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
            SizedBox(height: 10,),
           
           
             //for categories
    
SizedBox(
  height: 240,
  
    //color: Colors.white,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0.1,
        childAspectRatio: 0.87
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return  GestureDetector(
              onTap: () {
                setState(() {
                  selecetIndex=index;
                });
                
              },
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selecetIndex==index
                  ?Colors.blue[50]
                  :Colors.transparent
                ),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      child: Container(
                        height: MediaQuery.of(context).size.height/14,
                         width: MediaQuery.of(context).size.width/7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(categories[index].image),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(categories[index].title,style: 
                      TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),
              ),
            ) ;
      },
    ),
  
),

                 ///end category
                 ///image slider
                  SizedBox(height: 10,),
            ImageSlider(
              currentSlide: currentSlide,
              onChange:(value){
              setState(() {
                currentSlide=value;
              });
             },),
             SizedBox(height: 20,),
         
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                   [ 
                    Text('Bay Now',style: 
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
                     childAspectRatio: 0.70
                   ),
                   itemCount: selectedCategories[selecetIndex].length,
                   itemBuilder: (BuildContext context, int index) {
                     return ProductCart(product: selectedCategories[selecetIndex][index]);
                   },
                 ),



  



          ],
        
        ),
        
        ),
      ),
    );
  }
}
