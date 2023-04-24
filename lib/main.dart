import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newmeals/dummy_data.dart';
import 'package:newmeals/myapp/myapp_screens/product_detail_screen.dart';
import 'package:newmeals/myapp/myapp_screens/products_overview_screen.dart';
import 'package:newmeals/myhomepage.dart';
import 'package:newmeals/phone%20_verify/phone.dart';
import 'package:newmeals/phone%20_verify/verify.dart';
import 'package:newmeals/screens/categories_screen.dart';
import 'package:newmeals/screens/category_meals_screen.dart';
import 'package:newmeals/screens/filters_screen.dart';
import 'package:newmeals/screens/meal_detail_screen.dart';
import 'package:newmeals/screens/tabs_screen.dart';
import 'package:newmeals/ui_screen/login_screen.dart';
import 'package:newmeals/ui_screen/registration_screen.dart';
import 'package:newmeals/ui_screen/welcome_screen.dart';
import 'package:provider/provider.dart';
// import 'Login/Screens/login/components/auth_page.dart';
import 'models/meal.dart';
import 'package:newmeals/login/screens/login/components/auth_page.dart';
import 'package:newmeals/myapp/providers/products_provider.dart';
import 'myapp/myapp_home.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(

  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'const1': true,
    'const2': true,
    'const3': true,
    'const4': true,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  List<Meal>? get favoritething => null;
//upeer list<meal> recives data from toogleFavorite

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['const1']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['const2']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['const3']! && !meal.isVegan) {
          return false;
        }
        if (_filters['const4']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  ///Method to return Favorite
  ///this can be optimized by state management
  ///send this function to meal_details_screen
  ///pass it below in rotes table for mealDetailsScreen
  ///where favorites can be done by floating action button
  //
  void _toogleFavorite(String mealId) {
    //create a local variable to pass
    final existingIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favorites.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favorites.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }
  ///it will give a true value if the meal is present in the favorite
  ///pass this function as a argument from main to mealDetailsScreen
  bool _isMealFavorite(String id){
    return _favorites.any((meal)=> meal.id == id );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //it will only change the part of app which is listening
      // value: Products(),
       create: (ctx) => Products(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.lightGreen.shade100,
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Colors.lime.shade50),
                subtitle1:
                    TextStyle(fontSize: 24.5, fontFamily: 'RobotoCondensed'))),
        // home: CategoriesScreen(),
        // routes: {
        //   '/categories':(ctx)=> CategoryMealsScreen(categoryId, categoryTitle);
        // },
        // 165
        routes: {
          '/': (ctx) =>  AuthPage() ,
           '/prdovr':(ctx)=> ProductOverviewScreen(),
          // '/':(ctx) => const Myapp_Home(),
          //only for now
          'welcomwScreen': (ctx) => WelcomeScreen(),
          // '/': (ctx) => WelcomeScreen(),
          '/tabsScreen': (ctx) => TabScreen(_favorites),
          // CategoriesScreen()
          // CategoryMealsScreen.routeName :(ctx) => CategoryMealsScreen(_availableMeals),
          '/category-meals': (ctx) => CategoryMealsScreen(_availableMeals),
          // CategoryMealsScreen.routeName :(ctx) => CategoryMealsScreen.temp2(_availableMeals),
          MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toogleFavorite, _isMealFavorite),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          // ChatScreen.id: (context) => ChatScreen(),
          'phone': (context) => MyPhone(),
          'verify': (context) => MyVerify(),
          FilterScreen.routeName: (ctx) => FilterScreen(_setFilters),
          //'/favorites-screen': (ctx)=> Favorites(favoritething!),
          ////////////////////////////////////////////////////////////////
          //  '/myapp-home':(ctx) => Myapp_Home(),
          ///
          /// MyApp Routes :-
          ProductDetailScreen.routeName :(ctx)=> ProductDetailScreen(),

        },
        //for the default
        //works as a default page if no link is specified the it will move to this page /route
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const MyHomepage());
        },
        // MyHomePage(),
      ),
    );
  }
}
