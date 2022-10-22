

import 'package:daily_meals/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
