import 'package:flutter/material.dart';
import 'package:newmeals/extras/string_category.dart';
import 'package:newmeals/extras/string_favorite.dart';
import 'package:newmeals/screens/favorites.dart';
import 'categories_screen.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:flutter/foundation.dart';
import 'package:newmeals/widgets/main_drawer.dart';
import 'package:newmeals/models/meal.dart';
class TabScreen extends StatefulWidget {
  static const String id = 'tabs_screen';
  // String label1 = "Category";
  // String Label2 = "Favorites";
  final List<Meal> favorites;
  TabScreen(this.favorites);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

//indexing of pages
//store the name of the page i.e category or favorites
  late List<Map<String,Widget>> _pages ;
  //widget can be used in built state onlt , but if tou want to access it outside , you can create a init state
  void initState(){
    _pages =[
      {'page':CategoriesScreen() , 'label': Category_String()},
      {'page':Favorites(widget.favorites) , 'label': Favorite_String()},
      //we forward the widget.favorites to filters_screen
    ];
  }

  int _selectedPageIndex =0 ;
  //this method is responsible for the selection of the method (screen in navigation bar
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index ;
    });

  }
  @override
  Widget build(BuildContext context) {
     return
    // DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child:
    Scaffold(
        appBar: AppBar(
          ///
          //////////name of the tab /////////////////////////
          ///
          // title: Text('$titleofapp'),
          title: _pages[_selectedPageIndex]['label'] ,
        ),
        ///
      /// drawer
      drawer: Drawer(
        child: MainDrawer(),
      ),
        body: _pages[_selectedPageIndex]['page'],
        //TabBarView will take the same ammount of tabs as wer have mentioned in DefaultTabController

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green.shade700,
        currentIndex:_selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.lightGreen,
            icon: Icon(Icons.category),
            label: 'Category'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
              label: 'Favorite'
          ),
        ],
      ) ,
    );
  }
}

// bottom:TabBar(
// //can cange the color or do many functionalities
//
// tabs: <Widget>[
// Tab(
// icon: Icon(
// Icons.category,
// ),
// text: 'Categories',
// ),
// Tab(
// icon: Icon(
// Icons.favorite
// ),
// text: 'Favourite',
// ),
// ],
// ) ,
//
// TabBarView(
// children: <Widget>[
// //taking two screens
// CategoriesScreen()
// , Favorites(),
// ],
// ),
// //),