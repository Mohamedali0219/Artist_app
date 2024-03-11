import 'package:elysium/widgets/custom_category.dart';
import 'package:elysium/const.dart';
import 'package:flutter/material.dart';

class CreatePageListView extends StatelessWidget {
  const CreatePageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CustomCategory(
              createCategoryModel: items[index],
            );
          }),
    );
  }
}
