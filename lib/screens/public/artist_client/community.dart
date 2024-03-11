import 'package:elysium/constants/colors.dart';
import 'package:elysium/screens/public/courses.dart';
import 'package:elysium/screens/public/events.dart';
import 'package:elysium/screens/public/posts.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistCommunity extends StatefulWidget {
  const ArtistCommunity({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<ArtistCommunity> createState() => _ArtistCommunityState();
}

class _ArtistCommunityState extends State<ArtistCommunity> {
  PageController pageController = PageController();
  int selectedTab = 0;

  List<String> communityTabBar = [
    "Posts",
    "Events",
    "Courses",
  ];

  List<Widget> communityPages = [];

  @override
  void initState() {
    super.initState();
    communityPages = [
      Posts(scrollController: widget.scrollController),
      Events(scrollController: widget.scrollController),
      Courses(scrollController: widget.scrollController),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 145.h),
        child: CustomAppBar(
          body: Column(
            children: [
              SizedBox(height: 21.h),
              Center(
                child: Text(
                  "Community",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: primaryColor,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(height: 21.h),
              // community tabBar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 43.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: communityTabBar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedTab = index;
                                pageController.animateToPage(
                                  selectedTab,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              decoration: BoxDecoration(
                                color:
                                    selectedTab == index ? primaryColor : null,
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: selectedTab == index
                                      ? primaryColor
                                      : tabBar,
                                  width: 2.3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  communityTabBar[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: selectedTab == index
                                        ? Colors.white
                                        : tabBar,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        children: communityPages,
      ),
    );
  }
}
