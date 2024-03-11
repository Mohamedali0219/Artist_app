// ignore_for_file: avoid_print

import 'package:elysium/constants/colors.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:draggable_bottom_sheet_nullsafety/draggable_bottom_sheet_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:iconly/iconly.dart';

class PostsDetails extends StatefulWidget {
  const PostsDetails({super.key});

  @override
  State<PostsDetails> createState() => _PostsDetailsState();
}

class _PostsDetailsState extends State<PostsDetails> {
  bool likeClicked = false;
  List<String> images = [
    'https://img.freepik.com/free-photo/abstract-illustration-multi-colored-paint-water-generated-by-ai_188544-15560.jpg?t=st=1709098518~exp=1709102118~hmac=22e9b336471f5a16043ca534b220e80a5184be3fa6c077afe385d61c7e0d35fd&w=2000',
    'https://img.freepik.com/free-photo/abstract-nature-painted-with-watercolor-autumn-leaves-backdrop-generated-by-ai_188544-9806.jpg?t=st=1709098547~exp=1709102147~hmac=f6295c0298b2f1a6dcb118ce7f667ebe097c749ec1bd4b01c63a80535f3e7303&w=2000',
    'https://img.freepik.com/free-photo/vibrant-abstract-painted-acrylic-colors-generated-by-ai_188544-16337.jpg?t=st=1709098563~exp=1709102163~hmac=4cad29504a3f923c35b8f4bd4f878f948dd3ffc45a8b34a02c35cd93b4ffee88&w=2000',
    'https://img.freepik.com/free-photo/high-quality-white-brown-abstract-painting-background_1409-4768.jpg?t=st=1709098586~exp=1709102186~hmac=4f0b98655abec95c4dc45db49fc8cdf519143694ce34dc23a977b2681d2be76c&w=2000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Container(
          color: Colors.white,
          child: CustomAppBar(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.w, 5.h, 5.w, 5.h),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_left_rounded,
                                size: 40.h,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10.w),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 27.h,
                                child: CircleAvatar(
                                  backgroundImage:
                                      const AssetImage('images/profile.png'),
                                  radius: 24.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kareem Ehab",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            "23 seconds",
                            style: TextStyle(
                              color: primaryColor.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        likeClicked = !likeClicked;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.h),
                      decoration: BoxDecoration(
                        color: likeClicked ? null : primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                      ),
                      child: Icon(
                        likeClicked ? IconlyBold.heart : IconlyLight.heart,
                        color: likeClicked ? Colors.red : Colors.white,
                        size: 37.h,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: DraggableBottomSheet(
        blurBackground: false,
        backgroundWidget: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              // image card swiper
              SizedBox(
                height: 0.460.sh,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 33.w),
                    child: SizedBox(
                      width: 0.65.sw,
                      child: CardSwiper(
                        padding: EdgeInsets.zero,
                        scale: 1,
                        numberOfCardsDisplayed: 3,
                        backCardOffset: const Offset(13, 13),
                        cardsCount: images.length,
                        allowedSwipeDirection:
                            const AllowedSwipeDirection.symmetric(
                                horizontal: true),
                        cardBuilder: (context, index, percentThresholdX,
                            percentThresholdY) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(8, -6),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(-7, 9),
                                    blurRadius: 4,
                                  ),
                                ],
                                border: Border.all(
                                  width: 8,
                                  color: Colors.white,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                              child: BlurHash(
                                hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                                image: images[index],
                                imageFit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        previewChild: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(
              color: const Color(0xffDFEAF1),
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: Column(
            children: [
              // scrolling handler
              Container(
                width: 45.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xffDFEAF1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 15.h),
              // comment/share buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40.r),
                          onTap: () {
                            print("comment");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconlyLight.chat,
                                  color: primaryColor,
                                  size: 30.h,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "153",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40.r),
                          onTap: () {
                            print("share");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconlyLight.send,
                                  color: primaryColor,
                                  size: 30.h,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "share",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 204, 204, 204),
                              radius: 25.h,
                              child: CircleAvatar(
                                backgroundImage:
                                    const AssetImage('images/profile.png'),
                                radius: 22.h,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 0.75.sw,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 7.h),
                              decoration: BoxDecoration(
                                color: const Color(0xffEBF4F7),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kareem Ehab",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "24 minuets",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    "This portrait beautifully captures the subject's soulful gaze, creating a sense of introspection and depth. The play of light and shadow adds a touch of mystery, enhancing the overall emotional impact of the image.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
        expandedChild: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(
              color: const Color(0xffDFEAF1),
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 45.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xffDFEAF1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 15.h),
              // comment/share buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40.r),
                          onTap: () {
                            print("comment");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconlyLight.chat,
                                  color: primaryColor,
                                  size: 30.h,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "153",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40.r),
                          onTap: () {
                            print("share");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconlyLight.send,
                                  color: primaryColor,
                                  size: 30.h,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "share",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 204, 204, 204),
                              radius: 25.h,
                              child: CircleAvatar(
                                backgroundImage:
                                    const AssetImage('images/profile.png'),
                                radius: 22.h,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 0.75.sw,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 7.h),
                              decoration: BoxDecoration(
                                color: const Color(0xffEBF4F7),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kareem Ehab",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "24 minuets",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    "This portrait beautifully captures the subject's soulful gaze, creating a sense of introspection and depth. The play of light and shadow adds a touch of mystery, enhancing the overall emotional impact of the image.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
        minExtent: 250.h,
        maxExtent: 0.9.sh,
      ),
    );
  }
}

// class DraggableBottomSheet extends StatefulWidget {
//   @override
//   _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
// }

// class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onVerticalDragUpdate: (details) {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           builder: (BuildContext context) {
//             return DraggableScrollableSheet(
//               expand: true,
//               initialChildSize: 200 / MediaQuery.of(context).size.height,
//               minChildSize: 200 / MediaQuery.of(context).size.height,
//               maxChildSize: 1,
//               builder: (context, scrollController) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                   ),
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Draggable handle
//                         Container(
//                           width: 40,
//                           height: 5,
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         // Your content goes here
//                         Padding(
//                           padding: EdgeInsets.all(16),
//                           child: Text(
//                             'This is the draggable bottom sheet content.',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         // Add more widgets as needed
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//       child: Container(
//         height: 200,
//         color: Colors.blue,
//         child: Center(
//           child: Text(
//             'Drag me up!',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
