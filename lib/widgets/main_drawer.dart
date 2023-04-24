import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:newmeals/models/meal.dart';
import 'package:newmeals/screens/favorites.dart';
import 'package:newmeals/screens/tabs_screen.dart';
import 'package:newmeals/screens/filters_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

class MainDrawer extends StatefulWidget {

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // List<Meal>? get favoritething => favoritething!;
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.lightGreen,
            child: Text(
              '${titleofdwawer}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         ListTile(
            leading: Icon(Icons.shopping_bag, size: 30),
            title: Text(
              'Products',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            // onTap: () {},
            onTap: () {
              /// needed to be uncommented
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => TabScreen())
              //);
              // Navigator.pushNamed(context, TabScreen.id);
              ///
              Navigator.of(context).pushNamed('/tabsScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 30),
            title: Text(
              'Filters',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            // onTap: () {},
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => FilterScreen()),
              // );
              ///changed
              //  Navigator.pushReplacement(context, FilterScreen());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FilterScreen()),
              // );
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
            //onTapHandler is a arg in list tile
          ),
          ListTile(
            leading: Icon(Icons.favorite, size: 30),
            title: Text(
              'Favorites',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            onTap: (){
              // Navigator.of(context).pushReplacementNamed(Favorites.routeName);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>
              //       Favorites(favoritething!)),
              // );
             // Navigator.of(context).pushNamed('/favorites-screen');
            },

          ),

          ListTile(
            leading: Icon(Icons.shopping_cart, size: 30),
            title: Text(
              'Shop Application',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            onTap: (){

               },

          ),
      ListTile(
        leading: Icon(Icons.logout, size: 30),
        title: Text(
          'LogOut',
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade400),
        ),
        onTap: (){
          signUserOut;
        },
      ),
        ],
      ),
    );
  }
}
