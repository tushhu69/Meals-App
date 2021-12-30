import 'package:flutter/material.dart';
import '../screen/category_meals_screen.dart';
// ignore: unused_import
import '../dummy_data.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.title, this.color, this.id);
  void selectCategory(BuildContext ctx) {
    ////it helps to navigate between screens
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //pushnamed takwes a path ,here categorty measls
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    //inlwell is same as geastureDetcture but is also gives ripple effect on tap
    return InkWell(
      onTap: () => selectCategory(context),
      //splash tells the color of the ripple effect
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        //here we use conast in front opaadding because as we learned in deepdive module,applying const we tell flutter not to build
        //padding again when build is called again
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          textScaleFactor: 1.4,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline6,
        ),
        //here we used withopacity to make it a bit transparent
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
