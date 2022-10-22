

import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function filterData;
  final Map<String,bool> currentFilter;
  

  
  const FilterScreen({Key? key, required this.filterData, required this.currentFilter}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree=widget.currentFilter['gluten']!;
        _isLactoseFree=widget.currentFilter['lactose']!;

    _isVegan=widget.currentFilter['vegan']!;

    _isVegetarian=widget.currentFilter['vegetarian']!;

    super.initState();
  }

  Widget _buildSwitchList(
      String title, String subTitle, bool currentVal, Function updateValue) {
    return SwitchListTile(
      value: currentVal,
      onChanged: (value) {
        updateValue(value);
      },
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(onPressed: (){

            final selectedFilter={
  'gluten': _isGlutenFree,
  'lactose': _isLactoseFree,
  'vegetarian': _isVegetarian,
  'vegan': _isVegan,
 };
            
            widget.filterData(selectedFilter);}, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Manage Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchList(
                    'Gluten Free', 'Select Gluten Free Item', _isGlutenFree,
                    (newVal) {
                  setState(() {
                    _isGlutenFree = newVal;
                  });
                }),
                _buildSwitchList(
                    'Lactose Free', 'Select Sugar Free Item', _isLactoseFree,
                    (newVal) {
                  setState(() {
                    _isLactoseFree = newVal;
                  });
                }),
                _buildSwitchList(
                    'Vegetarian', 'Select Vegetable Item', _isVegetarian,
                    (newVal) {
                  setState(() {
                    _isVegetarian = newVal;
                  });
                }),
                _buildSwitchList(
                    'Vegan', 'Select Vegan Item', _isVegan,
                    (newVal) {
                  setState(() {
                    _isVegan = newVal;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
