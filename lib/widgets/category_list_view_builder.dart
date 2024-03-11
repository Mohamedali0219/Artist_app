import 'package:elysium/model/category_model.dart';
import 'package:elysium/widgets/artist_category.dart';
import 'package:flutter/material.dart';

class CategoryListViewBuilder extends StatelessWidget {
  CategoryListViewBuilder({super.key});
  final List<CategoryModel> categoryList = [
    CategoryModel(
      title: 'Blue-Art event',
      address: 'Alexandria Bibliotheca',
      date: 'on April 7th, 2024',
      image: 'images/event0.jpg',
    ),
    CategoryModel(
      title: 'Blue-Art event',
      address: 'Alexandria Bibliotheca',
      date: 'on April 7th, 2024',
      image: 'images/event1.jpg',
    ),
    CategoryModel(
      title: 'Blue-Art event',
      address: 'Alexandria Bibliotheca',
      date: 'on April 7th, 2024',
      image: 'images/event2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: ArtistCategory(
              categoryModel: categoryList[index],
            ),
          );
        },
      ),
    );
  }
}
