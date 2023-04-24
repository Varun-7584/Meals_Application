import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//foundation is for having the required argumnent

enum Complexity{
  //used to make choice among alternatives
  Simple ,
  Challenging,
  Hard
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal {
  final String id;
  final List<String> categories;
  final String title ;
  final String imageUrl ;
  //network image
  final List<String> ingredients;
  final List<String>steps ;
 // late final String summary ;
  // late final String rating ;
  final int duration ;
  //using enum
  final Complexity complexity ;
  final Affordability affordability ;
  //using bools
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan ;
  final bool isVegetarian ;

  const Meal({
    required this.id ,
    required this.categories ,
    required this.title ,
    required this.affordability,
    required this.complexity,
    required this.duration ,
    required this.imageUrl ,
    required this.ingredients ,
    required this.steps,
   // required this.summary ,
    //required this.rating ,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan ,
    required this.isVegetarian ,
  });

}
