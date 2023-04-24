import 'package:flutter/material.dart';
import 'package:newmeals/models/meal.dart';

import '../widgets/meal_item.dart';

class Favorites extends StatefulWidget {

  static const String id ='favorites';
  static const routeName = '/favorites-screen';
  final List<Meal>favoritething ;
  Favorites(this.favoritething);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoritething.isEmpty) {
      return Center(
        child: Text('NO FAVORITES YET'
            '   ...   START ADDING SOME '),
        );
    }
    else{
      return
          //list in category_meal_screen
        ListView.builder(itemBuilder: (ctx , index){
          // previously we were returning this :- Text(categoryMeals[index].title);
          return MealItem(
              id: widget.favoritething[index].id,
              title: widget.favoritething[index].title,
              imageUrl: widget.favoritething[index].imageUrl,
              duration: widget.favoritething[index].duration,
              complexity: widget.favoritething[index].complexity,
              affordability: widget.favoritething[index].affordability

          );
        },
          itemCount: widget.favoritething.length,
        );
    }
  }
}
