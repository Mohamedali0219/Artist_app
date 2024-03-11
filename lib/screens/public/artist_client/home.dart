// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:elysium/constants/colors.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:elysium/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtistClientHome extends StatefulWidget {
  const ArtistClientHome({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<ArtistClientHome> createState() => _ArtistClientHomeState();
}

class _ArtistClientHomeState extends State<ArtistClientHome> {
  List<String> drawingList = [
    "All",
    "Landscape",
    "Graffiti",
    "Digital",
    "Sketches",
    "Anime/Manga",
    "Surreal",
    "Calligraphy",
    "3D"
  ];

  List<String> paintings = [
    "images/painting0.jpg",
    "images/painting1.jpg",
    "images/painting2.jpg",
    "images/painting3.jpg"
  ];

  List<String> projectCategory = ["Sketches", "Digital", "3D"];

  List<bool> isExpandedList = List.generate(5, (index) => false);

  int displayedImage = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 220.h),
        child: CustomAppBar(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor.withOpacity(0.3),
                          radius: 28.h,
                          child: CircleAvatar(
                            backgroundImage:
                                const AssetImage('images/profile.png'),
                            radius: 25.h,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi Kareem",
                              style: TextStyle(
                                fontSize: 18.58.sp,
                                color: primaryColor.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Let's be creative",
                              style: TextStyle(
                                fontSize: 20.26.sp,
                                color: primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Badge(
                      backgroundColor: Colors.red,
                      smallSize: 10.h,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 35.h,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 21.h),
              // search bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Search(),
              ),
              SizedBox(height: 14.h),
              // tabBar
              SizedBox(
                height: 36.h,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: drawingList.length,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: index == 0 ? primaryColor : null,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: index == 0 ? primaryColor : tabBar,
                                  width: 2.3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  drawingList[index],
                                  style: TextStyle(
                                    color: index == 0 ? Colors.white : tabBar,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (index == drawingList.length - 1)
                                  ? 20.w
                                  : 10.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // most ordered
            SizedBox(
              height: 300.h,
              child: PageView.builder(
                itemCount: paintings.length,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      MostOrders(
                        index: index,
                        paintings: paintings,
                      ),
                    ],
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    displayedImage = index;
                  });
                },
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(70.r),
                  border: const Border(
                    top: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 5.h,
                  child: ListView.builder(
                    itemCount: paintings.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          if (index != 0)
                            SizedBox(
                              width: 5.w,
                            ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: displayedImage == index ? 25.w : 5.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(70.r),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 13.h),
            // projects
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // project card
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // arrow up button
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Material(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.r),
                                topLeft: Radius.circular(50.r),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.r),
                                  topLeft: Radius.circular(50.r),
                                ),
                                onTap: () {
                                  setState(() {
                                    isExpandedList[index] =
                                        !isExpandedList[index];
                                  });
                                  print(isExpandedList[index]);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  width: 40.w,
                                  height: isExpandedList[index] ? 26.h : 0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50.r),
                                      topLeft: Radius.circular(50.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: Colors.white,
                                      size: 25.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(17.r),
                            onTap: () {
                              print("project card");
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: isExpandedList[index] ? 380.h : 190.h,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.r),
                                border: Border.all(
                                  color: secondaryColor,
                                  width: 3,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // project details
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                    width: isExpandedList[index]
                                        ? MediaQuery.of(context).size.width *
                                            0.85
                                        : MediaQuery.of(context).size.width *
                                            0.55,
                                    decoration: BoxDecoration(
                                      color: isExpandedList[index]
                                          ? Colors.transparent
                                          : projectsBg,
                                      borderRadius: isExpandedList[index]
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              topRight: Radius.circular(10.r),
                                            )
                                          : BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              bottomLeft: Radius.circular(10.r),
                                            ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInOut,
                                          height: 170.h,
                                          padding: EdgeInsets.all(6.h),
                                          decoration: BoxDecoration(
                                            color: projectsBg,
                                            borderRadius: isExpandedList[index]
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.r),
                                                    topRight:
                                                        Radius.circular(10.r),
                                                  )
                                                : BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.r),
                                                    bottomLeft:
                                                        Radius.circular(10.r),
                                                  ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        primaryColor
                                                            .withOpacity(0.3),
                                                    radius: 24.h,
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          const AssetImage(
                                                              'images/profile.png'),
                                                      radius: 21.h,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Kareem Ehab',
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 23.h,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemCount:
                                                              isExpandedList[
                                                                      index]
                                                                  ? projectCategory
                                                                      .length
                                                                  : 2,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Row(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          index == 2
                                                                              ? 4
                                                                              : 10.w),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            9.r),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: primaryColor
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      projectCategory[
                                                                          index],
                                                                      style:
                                                                          TextStyle(
                                                                        color: primaryColor
                                                                            .withOpacity(0.7),
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            11.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 4.w,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'I envision a piece that skillfully captures the essence of a landscape, transporting viewers to a realm where the beauty of nature unfolds with every brushstroke.',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    isExpandedList[index]
                                                        ? MainAxisAlignment
                                                            .start
                                                        : MainAxisAlignment
                                                            .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Artist level',
                                                        style: TextStyle(
                                                          color: primaryColor
                                                              .withOpacity(0.6),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.sp,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Intermediate',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // space between level and address
                                                  AnimatedContainer(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.easeInOut,
                                                    width: isExpandedList[index]
                                                        ? 80.w
                                                        : 0,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Address',
                                                        style: TextStyle(
                                                          color: primaryColor
                                                              .withOpacity(0.6),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.sp,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Alexandria, Egypt',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // bottom containers
                                        AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInOut,
                                          height:
                                              isExpandedList[index] ? 185.h : 0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight:
                                                  Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // time & proposals
                                              AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                width: isExpandedList[index]
                                                    ? 150.w
                                                    : 0,
                                                height: 185.h,
                                                padding: EdgeInsets.all(6.h),
                                                decoration: BoxDecoration(
                                                  color: projectsBg,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.r),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      29.w,
                                                                  vertical:
                                                                      4.h),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                              color: primaryColor
                                                                  .withOpacity(
                                                                      0.8),
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .access_time_filled_outlined,
                                                                color: primaryColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                size: 24.h,
                                                              ),
                                                              Text(
                                                                '17 Days',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize:
                                                                      18.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      28.w,
                                                                  vertical:
                                                                      4.h),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                              color: primaryColor
                                                                  .withOpacity(
                                                                      0.8),
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'proposals',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: primaryColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      13.sp,
                                                                ),
                                                              ),
                                                              Text(
                                                                '10 to 50',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      18.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // bottom apply & price button
                                              AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                width: isExpandedList[index]
                                                    ? 210.w
                                                    : 0,
                                                height: 185.h,
                                                padding: EdgeInsets.all(6.h),
                                                decoration: BoxDecoration(
                                                  color: projectsBg,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10.r),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .moneyBills,
                                                              size: 24.h,
                                                              color: primaryColor
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            SizedBox(
                                                              height: 4.h,
                                                            ),
                                                            Text(
                                                              '800-1300 \$',
                                                              style: TextStyle(
                                                                color:
                                                                    primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 20.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Material(
                                                              color:
                                                                  primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                              child: InkWell(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                onTap: () {
                                                                  print(
                                                                      "apply now");
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration:
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                  width: isExpandedList[
                                                                          index]
                                                                      ? 160.w
                                                                      : 0,
                                                                  height: 40.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'apply now',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            15.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 8.h,
                                                            ),
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Colors
                                                                        .lightGreen,
                                                                    size: 18.h,
                                                                  ),
                                                                  Text(
                                                                    'verified buyer',
                                                                    style:
                                                                        TextStyle(
                                                                      color: primaryColor
                                                                          .withOpacity(
                                                                              0.7),
                                                                      fontSize:
                                                                          13.sp,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  // right apply & price button
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                    width: isExpandedList[index]
                                        ? 0
                                        : MediaQuery.of(context).size.width *
                                            0.30,
                                    height: 173.h,
                                    decoration: BoxDecoration(
                                      color: projectsBg,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.moneyBills,
                                                  size: 24.h,
                                                  color: primaryColor
                                                      .withOpacity(0.6),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  '800-1300 \$',
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Column(
                                              children: [
                                                Material(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    onTap: () {
                                                      print("apply now");
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 9.h,
                                                              horizontal: 25.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                      child: Text(
                                                        'apply now',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.verified,
                                                        color:
                                                            Colors.lightGreen,
                                                        size: 18.h,
                                                      ),
                                                      Text(
                                                        'verified buyer',
                                                        style: TextStyle(
                                                          color: primaryColor
                                                              .withOpacity(0.7),
                                                          fontSize: 13.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // arrow down button
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Material(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.r),
                                bottomLeft: Radius.circular(50.r),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.r),
                                  bottomLeft: Radius.circular(50.r),
                                ),
                                onTap: () {
                                  setState(() {
                                    isExpandedList[index] =
                                        !isExpandedList[index];
                                  });
                                  print(isExpandedList[index]);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  width: 40.w,
                                  height: isExpandedList[index] ? 0 : 26.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50.r),
                                      bottomLeft: Radius.circular(50.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white,
                                      size: 25.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MostOrders extends StatelessWidget {
  const MostOrders({
    super.key,
    required this.paintings,
    required this.index,
  });

  final List paintings;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.9.sw,
      child: Stack(
        children: [
          Positioned(
            bottom: 13.h,
            right: 0,
            left: 0,
            child: Container(
              height: 240.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(-4, 5),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(paintings[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // order numbers
                  Positioned(
                    bottom: 100.h,
                    left: 35.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 5,
                          sigmaX: 5,
                        ),
                        child: Container(
                          height: 32.h,
                          width: 125.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff779CA7).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: SvgPicture.asset(
                                    'images/crown.svg',
                                    height: 16.h,
                                  ),
                                ),
                                SizedBox(width: 9.w),
                                Text(
                                  "213 order",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 0.9.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // artist info
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaY: 3,
                                sigmaX: 3,
                              ),
                              child: Container(
                                height: 100.h,
                                width: 230.w,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff779CA7).withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.w, vertical: 11.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kareem Ehab',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Digital & 3D',
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: SizedBox(
                                                  height: 18.h,
                                                  child: const Reviews(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Alexandria, Egypt',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 20.h,
                                            width: 2.w,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          Text(
                                            '\$ 20/h',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // chat
                          Material(
                            color: const Color(0xff779CA7).withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                              ),
                              onTap: () {
                                print("Chat$index");
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 3,
                                    sigmaX: 3,
                                  ),
                                  child: Container(
                                    height: 65.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.r),
                                      ),
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.facebookMessenger,
                                      color: Colors.white,
                                      size: 32.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // artist picture
          Positioned(
            right: 0,
            left: 0,
            child: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.4),
              radius: 56.h,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55.h,
                child: CircleAvatar(
                  backgroundImage: const AssetImage('images/profile.png'),
                  radius: 50.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Icon(
          Icons.star_rounded,
          size: 18.h,
          color: Colors.yellow,
        );
      },
    );
  }
}
