// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class Events extends StatefulWidget {
   Events({
    super.key,
    required this.scrollController
  });

  final ScrollController scrollController;
  
  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, eventsIndex) {
        return Column(
          children: [
            if (eventsIndex == 0)
              SizedBox(
                height: 10.h,
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 280.h,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: AssetImage('images/event$eventsIndex.jpg'),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  color: Colors.white.withOpacity(0.9),
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
                    ),
                    // attend event button
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: InkWell(
                    //     onTap: () {
                    //       print("Attend Event");
                    //     },
                    //     child: Container(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 12.w, vertical: 17.h),
                    //       decoration: BoxDecoration(
                    //         gradient: const LinearGradient(
                    //           begin: Alignment(1.5, 0.5),
                    //           end: Alignment(-0.2, 0.1),
                    //           colors: [
                    //             Colors.black,
                    //             Colors.transparent,
                    //           ],
                    //         ),
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(20.r),
                    //         ),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             FontAwesomeIcons.userGroup,
                    //             size: 25.h,
                    //             color: Colors.white.withOpacity(0.8),
                    //           ),
                    //           SizedBox(height: 10.h),
                    //           Text(
                    //             "Attend Event",
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: 15.sp,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
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
