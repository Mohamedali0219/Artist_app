// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:elysium/constants/colors.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistChat extends StatefulWidget {
  const ArtistChat({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<ArtistChat> createState() => _ArtistChatState();
}

class _ArtistChatState extends State<ArtistChat> {
  List<int> messages = [1, 3, 0, 9, 0, 35, 0, 0, 3, 213, 5, 1];

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      scrollController: widget.scrollController,
      appBarColor: primaryColor,
      title: Text(
        "Inbox",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 28.sp,
        ),
      ),
      centerTitle: true,
      headerExpandedHeight: 0.2,
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
                "Inbox",
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
                print(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                margin: EdgeInsets.symmetric(vertical: 13.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColor.withOpacity(0.2),
                      radius: 29.h,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage('images/profile.png'),
                        radius: 28.h,
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
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "5 minuets",
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
                              if (messages[index] <= 0)
                                Icon(
                                  Icons.done_all_rounded,
                                  size: 23.h,
                                  color: seenColor,
                                ),
                              if (messages[index] <= 0)
                                SizedBox(
                                  width: 4.w,
                                ),
                              Expanded(
                                child: Text(
                                  "Hello sir, i just wanna thank you for delivering my painting",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              messages[index] > 0
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: seenColor,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Text(
                                        messages[index] > 99
                                            ? "99+"
                                            : "${messages[index]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                    )
                                  : Container(),
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
