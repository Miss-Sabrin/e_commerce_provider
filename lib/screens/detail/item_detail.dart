import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final ProductModel product;
  const ItemDetails({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.bold

        ),),
        SizedBox(height: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${product.price}",style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.bold

        ),),
        SizedBox(height: 10,),
        //for rating
        Row(
          children: [
            Container(
              width: 60,
              height: 23,
              decoration: BoxDecoration(
                color: kprimarayColor,
                borderRadius: BorderRadius.circular(15),

              ),
              //alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
              Icon(Icons.star,color: Colors.white,size: 14,),
              SizedBox(width: 3,),
              Text(product.rate.toString(),
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white),)

              ],)

            ),
            SizedBox(width: 5,),
            Text(product.review,style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),)
          ],
        ),
       


          ],
        ),
        SizedBox(height: 10,),
      
        //const Spacer(),
         Text.rich(
          TextSpan(children:[
            TextSpan(text: 'seller',style: TextStyle(fontSize: 16)
            ),
            TextSpan(text: product.saller,
            style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.bold))

          ]
         
          )
          
        )
        
        
      ],
    );
  }
}