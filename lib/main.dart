import 'package:daily_meals/dummy_data.dart';
import 'package:daily_meals/model/meal.dart';
import 'package:daily_meals/screens/category_meals_screen.dart';
import 'package:daily_meals/screens/filter_screen.dart';

import 'package:daily_meals/screens/meal_detail_screen.dart';
import 'package:daily_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 Map<String,bool> _filters={
  'gluten': false,
  'lactose': false,
  'vegetarian': false,
  'vegan': false
 }; 

 List<Meal> _availabelMeals=DUMMY_MEALS;
 List<Meal> _favoriteMeal=[];

 void _setFilter(Map<String,bool> filterData){
  setState(() {
    _filters=filterData;
    _availabelMeals=DUMMY_MEALS.where((element) {
      if(_filters['gluten']== true && !element.isGlutenFree){
        return false;
      }
      if(_filters['lactose']== true && !element.isLactoseFree){
        return false;
      }
      if(_filters['vegetarian']== true && !element.isVegetarian){
        return false;
      }
      if(_filters['vegan']== true && !element.isVegan){
        return false;
      }
      return true;
    }).toList();
  });
 }

 void _favoriteToggle(String mealId){
  final exisTingIndex= _favoriteMeal.indexWhere((meal) => meal.id==mealId);
  if(exisTingIndex>=0){
    setState(() {
      _favoriteMeal.removeAt(exisTingIndex);
    });
  }else{
    setState(() {
      _favoriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
    });
  }
 }
 bool _isFavoriteMeal(String id){
  return _favoriteMeal.any((element) => element.id==id);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          headline6: const TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)
        ),
      ),
      //home:  const TabsScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=> TabsScreen(favoriteMeal: _favoriteMeal,),
        CategoryMealsScreen.routeName:(context) =>  CategoryMealsScreen(availableMeals: _availabelMeals,),
        MealDetailScreen.routeName:(context) =>  MealDetailScreen(_favoriteToggle,_isFavoriteMeal),
        FilterScreen.routeName:(context) => FilterScreen(filterData: _setFilter,currentFilter: _filters,), 
      },
    );
  }
}

