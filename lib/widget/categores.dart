import 'package:e_commerce_provider/model/category_model.dart';
import 'package:flutter/material.dart';

class Categores extends StatelessWidget {
  const Categores({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, 
        separatorBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(categories[index].image),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 5,),
              Text(categories[index].title,style: 
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),)
            ],
          ) ;
        },
        itemBuilder: (BuildContext context, int index) =>SizedBox(width: 20,)
         
      ),
    );
  }
}