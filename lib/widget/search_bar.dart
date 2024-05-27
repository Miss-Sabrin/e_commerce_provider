import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
 
      ),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      child: Row(children: [
        Icon(Icons.search,color: Colors.grey,size: 30,),
        const SizedBox(width: 10,),
        const Flexible(
          flex: 4,
          
          child:TextField(decoration: 
          InputDecoration(hintText: 'search...',
          border: InputBorder.none,

          ),) ),
          Container(
            width: 1.5,height: 35,
            color: Colors.grey,
          ),
          IconButton(onPressed: (){},
           icon: Icon(Icons.tune_sharp,color: Colors.grey,))

      ],),
    );
  }
}