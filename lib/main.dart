import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screen/filtters.dart';
import 'package:meals_app/screen/meals_detail_screen.dart';
import './screen/tabs_screen.dart';
import 'screen/categories_screen.dart';
import 'screen/category_meals_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactoose': false,
    'vegetarian': false,
    'vegan': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favMeals = [];
  void setfiltters(Map<String, bool> filterdata) {
    filters = filterdata;
    availableMeals = DUMMY_MEALS.where((element) {
      if (filters['gluten'] && !element.isGlutenFree) return false;
      if (filters['lactoose'] && !element.isLactoseFree) return false;
      if (filters['vegetarian'] && !element.isVegetarian) return false;
      if (filters['vegan'] && !element.isVegan) return false;
      return true;
    }).toList();
  }

  void toggleFav(String mealID) {
    ///if element is present then indexwhere will return the index of that element else -1
    final exisitenceindex = favMeals.indexWhere((meal) => meal.id == mealID);
    if (exisitenceindex >= 0) {
      setState(() {
        favMeals.removeAt(exisitenceindex);
      });
    } else {
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool isMealFav(String id) {
    //it will stop where uit find the same id
    return favMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMealss..',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.red[100],
        canvasColor: Colors.blue[10],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              bodyText1: TextStyle(color: Color.fromRGBO(22, 51, 51, 1)),
              // ignore: deprecated_member_use
              bodyText2: TextStyle(color: Color.fromRGBO(22, 51, 51, 1)),
              // ignore: deprecated_member_use
              subtitle1: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
            ),
      ),
      //here we want our home screen or first screnn to be Catogyscreen tso we pass it to home:
      // home: CategoryScreen(),
      initialRoute: '/',
      //it takes a map as input whict contains string as keys and object as the screnn of page we want to connt with it
      routes: {
        // '/' this is deafult,loads home:
        '/': (ctx) => TabsScreen(favMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFav, isMealFav),
        FilttersScreen.routeName: (ctx) => FilttersScreen(filters, setfiltters),
      },
      //this routes are define for any un registered route and it have argumnt as a functionmand shoyld return something
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      }, //this is used when flutter fails to generate any route, so itn is the last resort before failinmg or freezing flutter will try to use unknowroute
      //or ypu can say unkonwnroute is executed when onGenerate is not defined
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyHomePageState();
//   }
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meals App!!'),
//       ),
//       body: Center(child: Text('Nothing Yet!')),
//     );
//   }
// }
