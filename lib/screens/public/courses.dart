// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:elysium/constants/colors.dart';
import 'package:elysium/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

class Courses extends StatefulWidget {
  const Courses({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<String> courseImages = [
    "https://img.freepik.com/free-photo/senior-artist-studio-painting-with-watercolor_23-2150214884.jpg?t=st=1709450323~exp=1709453923~hmac=d7191f323599b83bf07dbbfc70e6c76bcd2f31a2fd15becc94d524ff9ad55eda&w=2000",
    "https://img.freepik.com/free-photo/senior-painter-using-watercolor-his-art_23-2150214826.jpg?t=st=1709450375~exp=1709453975~hmac=2495c88be8a9ae6a50162143d74e9248ac2f83133e547352400c24ae7b0b41f3&w=2000",
    "https://img.freepik.com/free-photo/young-woman-painting-with-acrylics-home_23-2148854553.jpg?t=st=1709450410~exp=1709454010~hmac=e5dec43bbf756145d23a044bc5a97041dc4e24f1ed213ab9a79e22b2dadb7061&w=2000",
    "https://img.freepik.com/free-photo/young-blonde-woman-painting-with-acrylics_23-2148854524.jpg?t=st=1709450430~exp=1709454030~hmac=729981e83a13cfec8533252ce7499692de47fc06303e242b061eda0476e9a613&w=2000",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: courseImages.length,
      shrinkWrap: true,
      itemBuilder: (context, courseIndex) {
        return Column(
          children: [
            if (courseIndex == 0)
              SizedBox(
                height: 10.h,
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                      color: primaryColor.withOpacity(0.2), width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // user information
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaY: 5,
                                sigmaX: 5,
                              ),
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.w, 6.h, 25.w, 6.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70.r),
                                  border: Border.all(
                                    color: primaryColor.withOpacity(0.4),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 24.h,
                                      child: CircleAvatar(
                                        backgroundImage: const AssetImage(
                                          'images/profile.png',
                                        ),
                                        radius: 21.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kareem Ehab",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                        Text(
                                          "23 seconds",
                                          style: TextStyle(
                                            color:
                                                primaryColor.withOpacity(0.8),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // delete post
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaY: 5,
                                sigmaX: 5,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70.r),
                                  border: Border.all(
                                    color: const Color(0xff445660)
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'images/delete.svg',
                                  height: 28.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      // course description
                      const ExpandableText(
                        text:
                            "I've completed all the videos of my new course of how to be a professional abstract artist and you can now start your first session with me, and after you finish this course you will be able to draw anything you want.",
                        expandText: 'See More',
                        collapseText: 'See Less',
                        linkColor: Colors.blue,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      // course promo video
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: Stack(
                          children: [
                            BlurHash(
                              hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                              image: courseImages[courseIndex],
                              imageFit: BoxFit.cover,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  print("Course number $courseIndex");
                                },
                                child: Icon(
                                  IconlyBold.play,
                                  color: Colors.white,
                                  size: 70.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      // course buy button
                      Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text(
                            "Buy this course",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
          ],
        );
      },
    );
  }
}
