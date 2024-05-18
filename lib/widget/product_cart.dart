import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/detail/detail.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  ProductModel product;
   ProductCart({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    double screanHeight=MediaQuery.of(context).size.height;
    double screanWidth=MediaQuery.of(context).size.width;
    final provider=FavoriteProvider.of(context);
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(product: product,)));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screanHeight *5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Center(child: Hero(
                  tag: product.image,
                  child: Image.asset(product.image,scale: 1.0,width: 130,height: 130,fit: BoxFit.cover,)),),
                SizedBox(height: 5,),
                Padding(padding: EdgeInsets.only(left: 10),
                child: Text(product.title,
                style: TextStyle(fontSize: 13,
                fontWeight: FontWeight.bold),),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("\$${product.price}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    //list color bes oo samenya 
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index)=>Container(
                          height: 18,
                          width: 18,
                          decoration:BoxDecoration(
                            color: product.colors[index],
                            shape: BoxShape.circle
                          
                          ) ,
                        )
                       )
                        
                      
                    )
                  ],
                )

              ],
            ),
          ),
          Positioned(child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40
          ,
              decoration: BoxDecoration(
                color: kprimarayColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),

              ),
              child: GestureDetector(
                onTap: (){
                  provider.toggleFavorite(product);

                },
                child: Icon(
                  provider.isExist(product)?
                  Icons.favorite:
                  
                  Icons.favorite_border,color: Colors.white,size: 22,),
              ),
            ),
          ))
        ],
      ),
    );
  }
}