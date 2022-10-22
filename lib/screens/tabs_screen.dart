import 'package:daily_meals/model/meal.dart';
import 'package:daily_meals/screens/category_screen.dart';
import 'package:daily_meals/screens/favorite_screen.dart';
import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;
  const TabsScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String, Object>> _pages;

   @override
  void initState() {
    _pages= [
    {'page': const CategoryScreen(), 'title': 'Categories'},
    {'page':  FavoriteScreen(widget.favoriteMeal), 'title': 'Favorites'},
  ];
    super.initState();
  }

  int _selectedPageIndex=0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items:const [
           BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
