import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  ProductModel product;
   AddToCart({super.key,required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
      int currentIndex=1;

  @override
  Widget build(BuildContext context) {
    //todo provider 
    final provider=CartPeovider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,

        ),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        alignment: Alignment.center,
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white)
                //color: Colors.white,            
                  ),
                child:Row(children: [
                  IconButton(onPressed: (){
                    //todo remove icon
                    if(currentIndex !=1){
                      setState(() {
                        currentIndex--;
                      });
                    }
                  },
           icon: Icon(Icons.remove,color: Colors.white,),),
           SizedBox(width: 5,),
           Text(currentIndex.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
           SizedBox(width: 5,),

           //add
            IconButton(onPressed: (){
              //todo add icon function
              setState(() {
                currentIndex ++;
              });
            },
           icon: Icon(Icons.add,color: Colors.white,),)

                ],) ,

            ),
            GestureDetector(
              onDoubleTap: () {

                //todo provider inta laka fulina
                provider.toggleFavorite(widget.product);

                const snackBar=SnackBar(
                  content: Text('successfully added ! ',
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                  ),
                  duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: kprimarayColor,
                  borderRadius: BorderRadius.circular(50),

                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text('add to cart',style: TextStyle(fontSize: 20,
                color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            )
          



        ],)
        

      ),
      
    
    );
  }
}