import 'dart:core';

import 'package:flutter/material.dart';
import 'package:newmeals/screens/tabs_screen.dart';
import 'package:newmeals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  static const id = 'filter_screen';

  final Function saveFilters;
  FilterScreen(this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ///four filter
  ///according to dummy data
  ///editable   /// or can be moved to dummy data or to api
  //_glutenfree
  bool _change1 = false;
  //_vegetarian
  bool _change2 = false;
  //_vegan
  bool _change3 = false;
  //_lactoseFree
  bool _change4 = false;

  var const1 = "Gluten Free";
  var const2 = "Vagetarian";
  var const3 = "Vegan";
  var const4 = "Lactose Free";

  var const1sub = "Only include Gluten-free Meals ";
  var const2sub = "Only include Vagetarian Meals";
  var const3sub = "Only include Vegan Meals";
  var const4sub = "Only include Lactose-free Meals ";

  /// above code is editable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Filters',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: <Widget>[
            //widget.saveFilters
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text(const1),
                    subtitle: Text(const1sub),
                    value: _change1,
                    onChanged: (newValue) {
                      _change1 = newValue;
                    }),
                SwitchListTile(
                    title: Text(const2),
                    subtitle: Text(const2sub),
                    value: _change2,
                    onChanged: (newValue) {
                      _change2 = newValue;
                    }),
                SwitchListTile(
                    title: Text(const3),
                    subtitle: Text(const3sub),
                    value: _change3,
                    onChanged: (newValue) {
                      _change3 = newValue;
                    }),
                SwitchListTile(
                    title: Text(const4),
                    subtitle: Text(const4sub),
                    value: _change4,
                    onChanged: (newValue) {
                      _change4 = newValue;
                    }),
                FloatingActionButton.extended(
                  onPressed: () {
                    final selectedFilter = {
                      'const1': _change1,
                      'const2': _change2,
                      'const3': _change3,
                      'const4': _change4,
                    };
                    widget.saveFilters(selectedFilter);
                  },
                  label: Text('Save',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),),
                ),
                SizedBox(height: 10.0),
                FloatingActionButton.extended(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => TabScreen()),
                   // );
                    // Navigator.of(context).pushNamed(TabScreen.id);
                  },
                  label: Text('Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    color: Colors.green.shade400,
                  ),),
                )
              ],
            ))
          ],
        ));
  }
}
