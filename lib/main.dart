//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:milliondollar/screen/home page.dart';
//import 'package:milliondollar/screen/splash home.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      routes: {
//        HomePage.routeName: (ctx) => HomePage(),
//      },
//      home: SplashHome(),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youcancook/provider.dart';
import 'package:youcancook/provider/meal.dart';
import 'package:youcancook/screen/splash%20home.dart';
import 'package:youcancook/screen2/categories_screen.dart';
import 'package:youcancook/screen2/category_meals_screen.dart';
import 'package:youcancook/screen2/filters_screen.dart';
import 'package:youcancook/screen2/meal_detail_screen.dart';
import 'package:youcancook/screen3/inputepage.dart';

import 'dummy.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const String testDevice = '';

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Maradona()),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(250, 226, 150, 1),
          primaryColor: Color.fromRGBO(52, 0, 106, 1),
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        home: SplashHome(_favoriteMeals),
        routes: {
          InputPage.routeName: (ctx) => InputPage(),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(),
          );
        },
      ),
    );
  }
}
