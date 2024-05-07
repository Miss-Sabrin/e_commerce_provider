import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';
class CusttomAppBar extends StatelessWidget {
  const CusttomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding:  EdgeInsets.all(20)
          ),
          onPressed: (){},
          icon: Image.asset('images/icon.png',height: 20,),
         ),
         IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding:  EdgeInsets.all(20)
          ),
          onPressed: (){},
          icon: Icon(Icons.notification_add_outlined,size: 20,)
         ),
         
    
      ],
    );
  }
}