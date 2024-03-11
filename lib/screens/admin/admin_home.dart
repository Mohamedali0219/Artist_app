import 'package:elysium/screens/admin/homedrawer.dart';
import 'package:elysium/screens/public/courses.dart';
import 'package:flutter/material.dart';
import 'package:elysium/constants/colors.dart';
import 'package:elysium/screens/public/events.dart';
import 'package:elysium/screens/public/posts.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:elysium/widgets/search_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    List<Widget> tabs = [
      TabBarItem(
        text: 'Home',
        pageName: 'admin_home',
        isSelected: _selectedIndex == 0,
        onTabSelected: () => _onTabSelected(0),
      ),
      TabBarItem(
        text: 'Events',
        pageName: 'Events',
        isSelected: _selectedIndex == 1,
        onTabSelected: () => _onTabSelected(1),
      ),
      TabBarItem(
        text: 'Posts',
        pageName: 'Posts',
        isSelected: _selectedIndex == 2,
        onTabSelected: () => _onTabSelected(2),
      ),
      TabBarItem(
        text: 'Projects',
        pageName: 'admin_home',
        isSelected: _selectedIndex == 3,
        onTabSelected: () => _onTabSelected(3),
      ),
      TabBarItem(
        text: 'Courses',
        pageName: 'Courses',
        isSelected: _selectedIndex == 4,
        onTabSelected: () => _onTabSelected(4),
      ),
    ];

    return Scaffold(
      drawer: HomeDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 260.h),
        child: CustomAppBar(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 7.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 35.r,
                        backgroundColor: primaryColor.withOpacity(0.2),
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundImage: AssetImage('images/profile.png'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Hi Kareem',
                                style: TextStyle(
                                  color: tabBar,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Let\'s be creative',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 60.w),
                      Icon(
                        Icons.notifications,
                        color: primaryColor,
                        size: 35,
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Search(),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: tabs,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<String> paintings = [
      "images/painting0.jpg",
      "images/painting1.jpg",
      "images/painting2.jpg",
      "images/painting3.jpg"
    ];

    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: 420.w,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paintings.length,
                  clipBehavior: Clip.antiAlias,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                            height: 280.h,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                image: AssetImage('images/event$index.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // event details
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    width: 0.91.sw,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment(-2.5, 2),
                                        end: Alignment(0.2, -0.2),
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w, vertical: 13.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Blue-Art Event",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                          Text(
                                            "Alexandria Bibliotheca",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                IconlyLight.calendar,
                                                size: 20.h,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "on April 7th, 2024",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )));
                  },
                  onPageChanged: (index) {},
                ),
              ),
              SizedBox(
                child: Posts(scrollController: _scrollController),
              ),
            ],
          ),
        );

      case 1:
        return Events(scrollController: _scrollController);
      case 2:
        return Posts(scrollController: _scrollController);
      case 3:
        return Container(
            // Replace with your projects widget
            );
      case 4:
        return Courses(scrollController: _scrollController);
      default:
        return Container();
    }
  }
}

class TabBarItem extends StatelessWidget {
  final String text;
  final String pageName;
  final bool isSelected;
  final VoidCallback onTabSelected;

  const TabBarItem({
    Key? key,
    required this.text,
    required this.pageName,
    required this.isSelected,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabSelected,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: BoxDecoration(
          color: isSelected ? tabBar : transparentColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: tabBar, width: 2.w),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : tabBar, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
