// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:elysium/screens/public/posts_datails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

class Posts extends StatefulWidget {
  const Posts({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<bool> likedStatusList = List.generate(4, (index) => false);
  PageController pageController = PageController();
  int currentImageIndex = 0;

  List<String> images = [
    'https://img.freepik.com/free-photo/abstract-illustration-multi-colored-paint-water-generated-by-ai_188544-15560.jpg?t=st=1709098518~exp=1709102118~hmac=22e9b336471f5a16043ca534b220e80a5184be3fa6c077afe385d61c7e0d35fd&w=2000',
    'https://img.freepik.com/free-photo/abstract-nature-painted-with-watercolor-autumn-leaves-backdrop-generated-by-ai_188544-9806.jpg?t=st=1709098547~exp=1709102147~hmac=f6295c0298b2f1a6dcb118ce7f667ebe097c749ec1bd4b01c63a80535f3e7303&w=2000',
    'https://img.freepik.com/free-photo/vibrant-abstract-painted-acrylic-colors-generated-by-ai_188544-16337.jpg?t=st=1709098563~exp=1709102163~hmac=4cad29504a3f923c35b8f4bd4f878f948dd3ffc45a8b34a02c35cd93b4ffee88&w=2000',
    'https://img.freepik.com/free-photo/high-quality-white-brown-abstract-painting-background_1409-4768.jpg?t=st=1709098586~exp=1709102186~hmac=4f0b98655abec95c4dc45db49fc8cdf519143694ce34dc23a977b2681d2be76c&w=2000'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, postsIndex) {
        return Column(
          children: [
            if (postsIndex == 0)
              SizedBox(
                height: 10.h,
              ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostsDetails(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 450.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return BlurHash(
                            hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                            image: images[index],
                            imageFit: BoxFit.cover,
                          );
                        },
                      ),
                      Padding(
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
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 6.h, 25.w, 6.h),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff445660)
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(70.r),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 24.h,
                                            child: CircleAvatar(
                                              backgroundImage: const AssetImage(
                                                  'images/profile.png'),
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
                                                  color: Colors.white,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "23 seconds",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
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
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(70.r),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.r),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 6,
                                  sigmaX: 6,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 15.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff445660)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Material(
                                              color: likedStatusList[postsIndex]
                                                  ? Colors.white
                                                      .withOpacity(0.5)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                                onTap: () {
                                                  setState(() {
                                                    // Toggle the like status
                                                    likedStatusList[
                                                            postsIndex] =
                                                        !likedStatusList[
                                                            postsIndex];
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                      vertical: 5.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.r),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        likedStatusList[
                                                                postsIndex]
                                                            ? IconlyBold.heart
                                                            : IconlyLight.heart,
                                                        color: likedStatusList[
                                                                postsIndex]
                                                            ? Colors.red
                                                            : Colors.white,
                                                        size: 25.h,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Text(
                                                        "462",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                                onTap: () {
                                                  print("comment");
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                      vertical: 5.h),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        IconlyLight.chat,
                                                        color: Colors.white,
                                                        size: 25.h,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Text(
                                                        "153",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                                onTap: () {
                                                  print("share");
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                      vertical: 5.h),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        IconlyLight.send,
                                                        color: Colors.white,
                                                        size: 25.h,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        "share",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 18.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 23.h,
                                            child: CircleAvatar(
                                              backgroundImage: const AssetImage(
                                                  'images/profile.png'),
                                              radius: 21.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kareem Ehab",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Text(
                                                  "Hello sir, i just wanna thank you for delivering my painting",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.white,
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
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }
}
