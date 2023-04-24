// import 'package:flutter/material.dart';
// class setfilter extends StatefulWidget {
//   const setfilter({Key? key}) : super(key: key);
//
//   void _setFilters(Map<String, bool> filterData) {
//     setState(() {
//       _filters = filterData;
//       _availableMeals = DUMMY_MEALS.where((meal) {
//         if(_filters['const1']!&& !meal.isGlutenFree){
//           return false ;
//         }
//         if(_filters['const2']!&& !meal.isVegetarian){
//           return false ;
//         }
//         if(_filters['const3']!&& !meal.isVegan){
//           return false ;
//         }
//         if(_filters['const4']!&& !meal.isLactoseFree){
//           return false ;
//         }
//         return true;
//       }).toList();
//     });
//   }
//
//   @override
//   State<setfilter> createState() => _setfilterState();
// }
//
// class _setfilterState extends State<setfilter> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       ;
//   }
// }
