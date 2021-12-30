import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

import '../widgets/meals_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favmeals;
  FavoritesScreen(this.favmeals);
  @override
  Widget build(BuildContext context) {
    if (favmeals.isEmpty) {
      return Center(
        child: Text('Nothing added yeet, Start adding something'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favmeals[index].id,
            title: favmeals[index].title,
            imageUrl: favmeals[index].imageUrl,
            duration: favmeals[index].duration,
            complexity: favmeals[index].complexity,
            affordability: favmeals[index].affordability,
            //removeItem: removeitem,
          );
        },
        itemCount: favmeals.length,
      );
    }
  }
}
