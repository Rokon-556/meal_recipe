import 'package:daily_meals/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,arguments: {
      'id':id,
      'title': title,
    },);
    // Navigator.of(context).push(MaterialPageRoute(builder: (_){
    //   return CategoryMealsScreen(categoryId: id, categoryName: title);
    // }));
  }    

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}
