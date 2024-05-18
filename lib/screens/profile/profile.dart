import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
 final size=MediaQuery.of(context).size;
 bool isPortrait=MediaQuery.of(context).orientation==Orientation.portrait;
   //double screanHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/profile3.png',
           height: size.height/1,

         
          width:double.infinity,
          fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 9,vertical: 10),
          child: Align(alignment: Alignment.bottomCenter,
          
          child: Card(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              
              ),
              child: Expanded(
                child: Container(
                  height:isPortrait?  size.height *0.4:size.width/2,
                  //width:isPortrait? size.width*0.5 :size.height/2,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal:8,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 42,
                                backgroundImage: AssetImage('images/profile3.png'),
                              ),
                              
                              
                            ],
                          ),
                          SizedBox(width: 40,),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black54,
                                    
                                  )
                                  
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5
                                
                                ),
                                child: Text('Add Freind'),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                 color: Colors.red
                                  
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5
                                
                                ),
                                child: Text('fllow',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        
                          
                        ],
                      ),
                        const SizedBox(height: 10,),
                          Text('sabrin omar',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                           Text('fluuter devloper',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45
                          ),),
                          SizedBox(height: 15,),
                          Text('flutter devlopre is a softwer engeenering who \n has perfomancy with the flutter from work to \n devlope mobile web ',
                          style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          
                
                    ],
                  ),
                  
                  
                  ),
                  
                  
                  
                  
                  
                  ),
              ),
                
              ),
          ),
          ),
          
          
          
          

        ],
      ),
    );
  }

  
}

SizedBox friendAndMore(title,number){
  return SizedBox(
    width: 110,
    child: Column(
      children: [
        Text(title,style: 
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black26
      ),),
       Text(number,style: 
      TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),)
      
      
      ],
    ),
  );
}