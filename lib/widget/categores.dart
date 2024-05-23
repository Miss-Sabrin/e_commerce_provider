import 'package:e_commerce_provider/model/category_model.dart';
import 'package:flutter/material.dart';

class Categores extends StatefulWidget {
  const Categores({super.key});

  @override
  State<Categores> createState() => _CategoresState();
}

class _CategoresState extends State<Categores> {
  int selecetIndex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, 
        separatorBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selecetIndex=index;
              });
              
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selecetIndex==index
                ?Colors.blue[200]
                :Colors.transparent
              ),
              child: Column(
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
              ),
            ),
          ) ;
        },
        itemBuilder: (BuildContext context, int index) =>SizedBox(width: 20,)
         
      ),
    );
  }
}