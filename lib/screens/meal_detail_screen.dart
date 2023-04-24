import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MealDetailsScreen extends StatelessWidget {
  // static const String id = 'meal_details_screen' ;
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailsScreen(this.toggleFavorite , this.isMealFavorite);

  ///it was a reference from main.dart file
  ///and calling is done below on onPressed

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  //this container is used again and again
  Widget buildContainer(Widget child) {
    return Container(
      height: 220,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreen.shade50,
        border: Border.all(color: Colors.green.shade700),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    //to get the dummy data make a final keyword
    //comparing the dummy data meal with the meal id we got
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade50,
      // appBar: AppBar(title: Text('$mealId'),
      //instead of this we do
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        //inside {} because we have more than one variable
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade50,
                  border: Border.all(color: Colors.green.shade700),
                ),
                // child: Image.network(src),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                  //   fit: BoxFit.fill
                ),
              ),
              //////////////////////////////////////////////////////////////////////
              // a seprate widget is made for this above
              buildSectionTitle(context, 'About :- '),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                selectedMeal.ingredients[index],
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                    itemCount: selectedMeal.ingredients.length),
              ),
              //////////////////////////////////////////////////////////////////////
              buildSectionTitle(context, 'Procedure :- '),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Divider(),
                      //divider is used to draw a horizontal line
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.delete),
            onPressed: () {
              Navigator.of(context).pop(mealId);
              //goto meal_item because of the id
            },
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
        child: Icon(isMealFavorite(mealId) ?Icons.favorite : Icons.favorite_border),
        //meal id is already available as we get from argument function
        onPressed: () {
          toggleFavorite(mealId);
          ///ID is coming from main page where the function is created and has a argument as id
        },
        ///now this will take to favorites screen
      ),
        ],
      ),
    );
  }
}
