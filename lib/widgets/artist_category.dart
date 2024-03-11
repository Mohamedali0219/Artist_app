import 'package:elysium/model/category_model.dart';
import 'package:flutter/material.dart';

class ArtistCategory extends StatelessWidget {
  const ArtistCategory({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 236,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          image: DecorationImage(
            image: AssetImage(categoryModel.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryDetails(categoryModel: categoryModel),
          ],
        ),
      ),
    );
  }
}

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.35,
      height: 79,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          const Color(0xff212060),
          const Color(0xff202660).withOpacity(0.06),
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryModel.title,
              style: textStyle(
                fontSize: 14.33,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              categoryModel.address,
              style: textStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Text(
              categoryModel.date,
              style: textStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 11.33,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: 'Poppins',
    );
  }
}
