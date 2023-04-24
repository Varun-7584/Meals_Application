import 'package:flutter/material.dart';
import 'package:newmeals/widgets/category_item.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);
  static const String id ='categories_screen';
  @override
  Widget build(BuildContext context) {
    return
    // Scaffold(
    //   backgroundColor: Colors.green.shade50,
    //   appBar: AppBar(
    //     backgroundColor: Colors.green.shade300,
    //     title: Text('Kulhads!',
    //     style: TextStyle(
    //         fontFamily: 'RobotoCondensed',
    //       fontWeight: FontWeight.bold
    //     ),),
    //   ),
      GridView(
        padding:  const EdgeInsets.all (20),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
          //this sends the data of which category_item was selected and the page to be shown
          catData.id  ,
          catData.title,
             catData.color ,
            ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
