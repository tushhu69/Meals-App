import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category';
  final List<Meal> avaiMeals;
  CategoryMealsScreen(this.avaiMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle;
  List<Meal> displayMeals;
  var initialdata = false;

  @override
  /*here we can not use inItstate because context is available glpbaly but it is not available in inItstate */
  // void initState() {
  //   //  implement initState
  //   final routArgs =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   catTitle = routArgs['title'];
  //   // ignore: unused_local_variable
  //   final catId = routArgs['id'];
  //   displayMeals = DUMMY_MEALS.where((meal) {
  //     return meal.categories.contains(catId);
  //   }).toList();
  // }
  // ignore: must_call_super
  void didChangeDependencies() {
    /*it runs many times afgter being initiaallized,it runs everytime widgets attached to it changes ,here remobeitem */
    if (!initialdata) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = routArgs['title'];
      // ignore: unused_local_variable
      final catId = routArgs['id'];
      displayMeals = widget.avaiMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      initialdata = true;
    }
  }

  void removeitem(String mealid) {
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    //here argumentsd give us the argumens that were passed in puahnamed and settign tells which route was loaded

    //gridview id similar tolistview,but iseted it displays tiles side by side
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            // removeItem: removeitem,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
