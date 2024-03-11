import 'package:elysium/widgets/app_bar.dart';
import 'package:elysium/widgets/category_list_view_builder.dart';
import 'package:elysium/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150.h),
        child: const CustomAppBar(
          body: DefultAppBar(
            title: 'All Events',
          ),
        ),
      ),
      body: CategoryListViewBuilder(),
    );
  }
}
