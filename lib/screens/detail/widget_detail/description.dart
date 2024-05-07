import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;
  const Description({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: kprimarayColor,
                borderRadius: BorderRadius.circular(20),
            
              ),
              alignment: Alignment.center,
              child:
               Text('description',style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white),),
              
            ),
             Text('spacefication',style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black),),
            Text('Reviw',style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black),),
          ],
        ),
        SizedBox(height: 10,),
        Text(text,style: TextStyle(fontSize: 16,color: Colors.grey),)
         
      ],
    );
  }
}