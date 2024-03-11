import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:elysium/constants/colors.dart';
import 'package:elysium/screens/admin/admin_chat_report.dart';
import 'package:elysium/screens/admin/admin_profile.dart';
import 'package:elysium/screens/admin/admin_report.dart';
import 'package:elysium/screens/artist/artist_chat.dart';
import 'package:elysium/screens/client/client_chat.dart';
import 'package:elysium/screens/client/client_profile.dart';
import 'package:elysium/screens/public/artist_client/community.dart';
import 'package:elysium/screens/public/artist_client/home.dart';
import 'package:elysium/screens/artist/artist_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import '../../constants/texts.dart';
import '../admin/admin_home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final PageController pageController = PageController();

  double phoneHeight = 0;
  List<Widget> artistPages = [];
  List<Widget> adminPages = [];
  List<Widget> clientPages = [];

  @override
  void initState() {
    super.initState();
    artistPages = [
      ArtistClientHome(scrollController: _scrollController),
      ArtistChat(scrollController: _scrollController),
      ArtistCommunity(scrollController: _scrollController),
      const ArtistProfile(),
    ];
    clientPages = [
      ArtistClientHome(scrollController: _scrollController),
      ClientChat(scrollController: _scrollController),
      ArtistCommunity(scrollController: _scrollController),
      const ClientProfile(),
    ];
    adminPages = [
      AdminHome(),
      AdminChat(scrollController: _scrollController),
      const AdminReports(),
      const AdminProfile(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ScrollToHide(
        scrollController: _scrollController,
        height: phoneHeight > 780.0 ? 0.064.sh : 0.07.sh,
        hideDirection: Axis.vertical,
        child: AnimatedBottomNavigationBar(
          shadow: BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 7,
            spreadRadius: 5,
          ),
          splashColor: primaryColor,
          icons: [
            selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
            selectedIndex == 1 ? IconlyBold.message : IconlyLight.message,
            selectedIndex == 2 ? IconlyBold.user_3 : IconlyLight.user_1,
            selectedIndex == 3 ? IconlyBold.profile : IconlyLight.profile,
          ],
          iconSize: 25.h,
          activeColor: primaryColor,
          inactiveColor: primaryColor.withOpacity(0.6),
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
      ),
      floatingActionButton: ScrollToHide(
        scrollController: _scrollController,
        height: 55,
        hideDirection: Axis.vertical,
        child: FloatingActionButton(
          elevation: 8,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          onPressed: () {},
          backgroundColor: scaffoldColor,
          child: Stack(
            children: [
              Center(
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'images/colorful_bg.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                color: Colors.white.withOpacity(0.4),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 0.7,
                  sigmaX: 0.7,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: primaryColor,
                    size: 40.h,
                    shadows: const [
                      BoxShadow(
                        color: secondaryColor,
                        blurRadius: 6,
                        spreadRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: user == "artist"
            ? artistPages
            : user == "client"
                ? clientPages
                : adminPages,
      ),
    );
  }
}
