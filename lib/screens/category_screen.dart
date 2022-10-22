import 'package:daily_meals/widgets/category_item.dart';
import 'package:daily_meals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map(
                (cateData) =>
                    CategoryItem(title: cateData.title, color: cateData.color,id: cateData.id,),
              )
              .toList(),
    );
  }
}
