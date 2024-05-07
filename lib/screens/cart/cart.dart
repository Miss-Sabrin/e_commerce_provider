import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/screens/cart/check_out.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/nav_botton.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=CartPeovider.of(context);
    final finalList=provider.cart;
    //todo for quantity
    productQuantity(IconData icon,int index){
      return GestureDetector(
        onTap: () {
          setState(() {
            icon==Icons.add
            ?provider.increamentQtn(index)
            :provider.decreamentQtn(index);

          });
          
        },
        child: Icon(icon,size: 20,),
      );
    }
    
    return  Scaffold(
  //todo for total check out caled
  bottomSheet: CheckOutBox(),
  backgroundColor: kcontentColor,
      body: SafeArea(
        
        child: Column(
        children: [
          Padding(padding: EdgeInsets.all(8),
          child: Row(children: [
               IconButton(
          style: IconButton.styleFrom(
          backgroundColor: Colors.white,

            padding:  EdgeInsets.all(20)
          ),
          onPressed: (){
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context)=> 
                const  BottomNvbar(),));
          },
          icon: Icon(Icons.arrow_back,size: 20,)
         ),
         Text('my cart',style: 
         TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
         ),),
         Container()
          ],),
          
          
          
          ///todo cart provider
          
          ),
          Expanded(child: 
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: finalList.length,
            itemBuilder: (BuildContext context, int index) {
              //todo making cart item
              final cartItem=finalList[index];
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                  
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                       color: Colors.white,

                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kcontentColor

                          
                        ),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(cartItem.image),
                        

                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.title,
                          style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6,),
                           Text(cartItem.category,
                          style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                          ),
                          ),
                          SizedBox(height: 6,),
                           Text(
                            '\$${cartItem.price}',
                          style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                          ),

                        ],
                      )

                    ],),

                  ),),

                  Positioned(
                    top: 35,
                    right: 35,
                    child:Column(children: [
                      IconButton(
                        onPressed: (){
                          finalList.removeAt(index);
                          setState(() {
                            
                          });
                        },
                         icon: Icon(Icons.delete,color: Colors.red,)),

                         const SizedBox(height: 10,),
                         //todo add and remove icons
                         Container(
                          decoration: BoxDecoration(
                            color: kcontentColor,
                            border: Border.all(
                              color: Colors.grey.shade200
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(children: [
                            SizedBox(width: 10,),
                            productQuantity(Icons.add, index),
                             SizedBox(width: 10,),

                            Text(cartItem.quantity.toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                            SizedBox(width: 10,),
                            productQuantity(Icons.remove, index),
                             SizedBox(width: 10,),

                          ],),
                         )


                    ],) )
                 
                
                ],
              );
            },
          ),
          
          )
        ],
      )),
  

    );
  }
}

///we used the provider state management to show the add to car items
// when user click on add to cart
//and same as favorite