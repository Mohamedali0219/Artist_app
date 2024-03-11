import 'dart:ui';

import 'package:draggable_home/draggable_home.dart';
import 'package:elysium/screens/admin/chatreportdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class AdminChat extends StatefulWidget {
  const AdminChat({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<AdminChat> createState() => _AdminChatState();
}

class _AdminChatState extends State<AdminChat> {
  List<int> messages = [1, 3, 0, 9, 0, 35, 0, 0, 3, 213, 5, 1];

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      scrollController: widget.scrollController,
      appBarColor: primaryColor,
      title: Text(
        "Chat Reports",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 28.sp,
        ),
      ),
      centerTitle: true,
      headerExpandedHeight: 0.2.h,
      headerWidget: Stack(
        children: [
          Image.asset(
            'images/colorful_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 500.h,
          ),
          Container(
            width: double.infinity,
            color: scaffoldColor.withOpacity(0.85),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Center(
              child: Text(
                "Chat Reports",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                  fontSize: 35.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: [
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: messages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatReportDetails()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                margin: EdgeInsets.symmetric(vertical: 13.h),
                child: Row(
                  children: [
                    Container(
                      width: 58.h, 
                      height: 58.h,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(0.2),
                              radius: 27.h,
                              child: CircleAvatar(
                                backgroundImage: const AssetImage('images/profile.png'),
                                radius: 26.h,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30.h, 
                            left: 25.h, 
                            child: CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(0.2),
                              radius: 15.h,
                              child: CircleAvatar(
                                backgroundImage: const AssetImage('images/painting1.jpg'),
                                radius: 14.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Kareem Ehab",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "just now",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 4.w,
                                ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('   Reports :  ' , style: TextStyle(fontSize:15.sp,
                                    color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),
                                    Text('Omar Wael',style: TextStyle(fontSize:20.sp,
                                    color: Colors.black , fontWeight: FontWeight.bold))

                                  ],
                                )
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              messages[index] > 0
                                  ? Icon(Icons.warning , color: Colors.red,)
                                  : Icon(Icons.warning , color: Colors.grey,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
