import 'package:elysium/constants/colors.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:elysium/widgets/custom_app_bar.dart';
import 'package:elysium/widgets/custom_category_list.dart';
import 'package:elysium/widgets/custom_text_form_field.dart';
import 'package:elysium/widgets/image_profile.dart';
import 'package:elysium/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProject extends StatefulWidget {
  const EditProject({super.key});

  @override
  State<EditProject> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150.h),
        child: const CustomAppBar(
          body: DefultAppBar(
            title: 'Edit Project',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: ImageProfile(),
              ),
              const CustomTextFormField(
                title: 'Frist name',
                hintText: 'Karem',
                height: 59,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                title: 'Last name',
                hintText: 'Ehab',
                height: 59,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                title: 'Email',
                hintText: 'karem@',
                height: 59,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                title: 'Hourly rate',
                hintText: '20\$/hr',
                height: 59,
                width: 215,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Category',
                style: textStyle(
                    fontSize: 17.77,
                    fontWeight: FontWeight.w600,
                    color: titleColor.withOpacity(0.76)),
              ),
              const SizedBox(
                height: 10,
              ),
              const CreatePageListView(),
            ],
          ),
        ),
      ),
    );
  }
}
