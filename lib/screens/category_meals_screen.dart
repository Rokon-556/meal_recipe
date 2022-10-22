import 'package:daily_meals/dummy_data.dart';
import 'package:daily_meals/model/meal.dart';
import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

 const CategoryMealsScreen({Key? key, required this.availableMeals}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeal;
  var _loadInitData=false;

  @override
  void didChangeDependencies() {
    if(!_loadInitData){
      final cateArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = cateArgs['title'];
    final categoryId = cateArgs['id'];
    displayedMeal = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    _loadInitData=true;
    }
    super.didChangeDependencies();
  }

void _removeMeal(String mealId){
   setState(() {
     displayedMeal!.removeWhere((meal) => meal.id==mealId);
   });
}

// final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeal![index].id,
              title: displayedMeal![index].title,
              imageUrl: displayedMeal![index].imageUrl,
              duration: displayedMeal![index].duration,
              complexity: displayedMeal![index].complexity,
              affordability: displayedMeal![index].affordability,);
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}
