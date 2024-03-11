import 'dart:ui';

import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/colorful_bg.png',
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          color: scaffoldColor.withOpacity(0.85),
        ),
        Positioned(
          bottom: -50.h,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  scaffoldColor
                      .withOpacity(0.0), // Transparent color at the top
                  scaffoldColor, // Centered color is white
                  scaffoldColor
                      .withOpacity(0.0), // Transparent color at the bottom
                ],
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              // user information
              SizedBox(
                height: 10.h,
              ),
              body,
            ],
          ),
        ),
      ],
    );
  }
}
