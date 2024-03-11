import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blur/blur.dart';

class HomeDrawer extends StatelessWidget {
static const int categories = 1 ;
static const int settings = 2 ;

HomeDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Blur(
              blur: 0.001,
              blurColor: Color.fromARGB(0, 229, 233, 220),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 100.h , horizontal: 200.w),
                      decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/painting3.jpg'),
                fit: BoxFit.cover,
              ),
                      ),
                  child: Text('' 
                  )),
            ),
            Row(
              children: [
                SizedBox(width: 5.w,),
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                                radius: 35.r,
                                backgroundColor: primaryColor.withOpacity(0.2),
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: AssetImage('images/profile.png'),
                                ),
                              ),
                  Text('Kareem Ehab' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold) ,),
                   Text('Kareemehab2323@gmail.com' , style: TextStyle(color: Colors.white , fontSize: 17 , fontWeight: FontWeight.w200) ,)
                  ],
                ),
                         
              ],
            ),]
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
    
              },
              child: Row(
                children: [
                  Icon(Icons.person , color: Colors.black,size: 40.r,),
                  SizedBox(width: 10,),
                  Text('Users' ,
                    style: TextStyle(color: Colors.black , fontSize: 25.r,fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
       
              },
              child: Row(
                children: [
                   Icon(Icons.inbox , color: Colors.black,size: 40.r,),
                  SizedBox(width: 10,),
                  Text('Events' ,
                    style: TextStyle(color: Colors.black , fontSize: 25.r,fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
       
              },
              child: Row(
                children: [
                   Icon(Icons.settings , color: Colors.black,size: 40.r,),
                  SizedBox(width: 10,),
                  Text('Settings' ,
                    style: TextStyle(color: Colors.black , fontSize: 25.r,fontWeight: FontWeight.w500))
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
