import 'package:flutter/material.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:newmeals/widgets/meal_item.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../models/meal.dart';
//this screen shows which category was selected
// class avail_list{
//   late final String categoryId ;
//   late final String categoryTitle ;

//   late final List<Meal>availableMeal ;
// }
class CategoryMealsScreen extends StatefulWidget {
  // const CategoryMealsScreen({Key? key}) : super(key: key);
  static const routeName = '/category-meals';

  // // //
  // late final String categoryId ;
  // late final String categoryTitle ;
  //  CategoryMealsScreen();
  late final List<Meal>availableMeal ;
  // CategoryMealsScreen.temp1(  this.categoryId, this.categoryTitle, Color color );
  CategoryMealsScreen(  this.availableMeal);
  // avail_list a = new avail_list();
  // CategoryMealsScreen(a);


  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   // final routeArgs = ModalRoute.of(ctx)?.settings.arguments as Map<String , String>;
   // categoryTitle = routeArgs['title'];
   // final categoryId = routeArgs['id'];



  void initState(){


    super.initState();
  }

  void _removeMeal(String mealId){

  }


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String ,Object>;
    print(routeArgs);
    final categoryTitle = routeArgs['title'].toString();
    final categoryId = routeArgs['id'];
    final Color = routeArgs['color'];
    late final categoryMeals = widget.availableMeal.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    // late String categoryTitle;
    late List<Meal>displayedMeals;

    return
      Scaffold(
        appBar: AppBar(
          //instad of showing the category item here we can show the title
          title: Text(categoryTitle),
        ),
        body:
          //build a listview //as builder because on spot creation
        ListView.builder(itemBuilder: (ctx , index){
          // previously we were returning this :- Text(categoryMeals[index].title);
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability
///this will be displayedmeals
          );
        },
        itemCount: categoryMeals.length,
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          children: [
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.menu_book),
              onPressed: () {},
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.search),
              onPressed: () {},
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.home),
              onPressed: () {},
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),

      );
  }
}
