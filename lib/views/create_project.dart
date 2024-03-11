import 'package:elysium/constants/colors.dart';
import 'package:elysium/widgets/adding_image.dart';
import 'package:elysium/widgets/app_bar.dart';
import 'package:elysium/widgets/custom_app_bar.dart';
import 'package:elysium/widgets/custom_bottom.dart';
import 'package:elysium/widgets/custom_category_list.dart';
import 'package:elysium/widgets/custom_text_form_field.dart';
import 'package:elysium/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150.h),
        child: const CustomAppBar(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefultAppBar(
                title: 'Create Project',
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFormField(
                height: 82,
                maxLines: 2,
                title: ' Description',
                hintText:
                    'I envision a piece that skillfully captures the essence of a land...',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFormField(
                    maxLines: 2,
                    title: ' Artist level',
                    hintText: 'intermediate',
                    width: screenWidth * 0.5,
                    height: 59,
                  ),
                  CustomTextFormField(
                    maxLines: 2,
                    title: 'Due date',
                    hintText: '8/6/2022',
                    height: 59,
                    width: screenWidth * 0.4,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CreatePageListView(),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                maxLines: 2,
                title: 'Price range',
                hintText: '780 - 950 \$',
                height: 59,
                width: screenWidth * 0.9,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Add images',
                style: textStyle(
                  color: titleColor.withOpacity(0.76),
                  fontWeight: FontWeight.w600,
                  fontSize: 17.77,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const AddingImage(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomBottom(
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
