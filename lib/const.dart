import 'package:elysium/model/create_view_category.dart';
import 'package:flutter/material.dart';

TextStyle textStyle({
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 11.33,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);
}

final List<CreateCategoryModel> items = [
  CreateCategoryModel(
    title: 'Landscape',
  ),
  CreateCategoryModel(
    title: 'Graffiti',
  ),
  CreateCategoryModel(
    title: 'Digital',
  ),
  CreateCategoryModel(
    title: 'Sketches',
  ),
  CreateCategoryModel(
    title: 'Anime/Manga',
  ),
  CreateCategoryModel(
    title: 'Surreal',
  ),
  CreateCategoryModel(
    title: 'Calligraphy',
  ),
  CreateCategoryModel(
    title: '3D',
  ),
];
