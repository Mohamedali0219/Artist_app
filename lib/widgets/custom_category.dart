import 'package:elysium/model/create_view_category.dart';
import 'package:elysium/const.dart';
import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.createCategoryModel});
  final CreateCategoryModel createCategoryModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: screenWidth * 0.6,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 198, 203, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              createCategoryModel.title,
              style: textStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
