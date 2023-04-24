import 'package:flutter/material.dart';
import 'package:newmeals/models/meal.dart';
import 'package:newmeals/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  //id is added later
  late final String id ;
  late final String title;
  late final String imageUrl;
  late final int duration;
  late final Complexity complexity;
  late Affordability affordability;

  //create a constructor for the same

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,

  });
//this create a img obj below

  String get complexitytext {
    // if(complexity== Complexity.Simple){
    //   return 'Simple';
    // }
    // if(complexity == Complexity.Challenging){
    //   return 'Challenging';
    // }
    // else{
    //   return 'Hard';
    // }
    //can be done using Switch
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown ';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordabile';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
    }
  }

  //to move to details screen created a function below :-
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName , arguments: id);

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //using stack so we can put another image on an image
            Stack(
              children: <Widget>[
                //to force the img in particular forum
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  ///////////////////forimage //////////////
                  //create a final of imageUrl , title etc //whatever need to be changed can be done using the keywords calling from meals.dart
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                /////////////////2nd stack widget
                //positioned can only be used in stack
                Positioned(
                  bottom: 20,
                  child: Container(
                    width: 380,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      //for safety
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            //add a row for information
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      //for getting the enum we have to create a getter i.e created above to get the enum values
                      Text(complexitytext),
                      //complexity text is the upper function in which we have switch statement
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.money),
                      SizedBox(width: 10),
                      //for getting the enum we have to create a getter i.e created above to get the enum values
                      Text(affordabilitytext),
                      //complexity text is the upper function in which we have switch statement
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
