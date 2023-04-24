import 'package:flutter/material.dart';
import 'package:newmeals/models/meal.dart';
import 'package:newmeals/screens/category_meals_screen.dart';
import '../dummy_data.dart';
//this file is for the category ex: italian , hampburger etc

class CategoryItem extends StatelessWidget {
  late final String id;
  late final String title;
  //this is the title of the category :- ex: italian
  late final Color color;

  //go to categories_screen :- as it passes the title and color , id from there we can fetch the title

  CategoryItem(this.id, this.title ,this.color);

  void selecCategory(BuildContext ctx) {
    //called down in onTap function
    //built ctx is a argument passed for the selected category
    Navigator.of(ctx).pushNamed(
      '/category-meals',
      arguments: {
        'id': id,
        'title': title,
        'color' : color ,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //InkWell is a type of gesture detector
      //for onTap to work :- make a function that gets us the itemsof a specified category :- ex: italian :- pizza
      onTap: () => selecCategory(context),
      //in the upper line we not passed ctx because its just a temp variable
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
